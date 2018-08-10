//
//  MHPasscodeView+Custom.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

extension MHPasscodeView: UIKeyInput {
    
    public var keyboardType: UIKeyboardType {
        get {
            return .numberPad
        }
        set {
            self.keyboardType = newValue
        }
    }
    
    public var hasText: Bool {
        return !passcodeText.isEmpty
    }
    
    public func insertText(_ text: String) {
        guard canInsertCharacters() else { return }
        passcodeText.append(text)
        
        guard let view = passcodeStackView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
                pinView.isFilled == false {
                return true
            }
            return false
        }).first as? PinView else { return }
        
        view.isFilled = true
        toggleAppreanceOf(view: view, withtext: text)
        
        if passcodeText.count == passcodeConfiguration.length {
            delegate?.didEnter(passcodeText)
        }
    }
    
    public func deleteBackward() {
        guard hasText else { return }
            passcodeText.removeLast()
        
        guard let view = passcodeStackView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
                pinView.isFilled == true {
                return true
            }
            return false
        }).last as? PinView else { return  }
        
        view.isFilled = false
        toggleAppreanceOf(view: view, withtext: nil)
    }
    
    func canInsertCharacters() -> Bool {
        guard passcodeText.count == passcodeConfiguration.length else { return true }
        return false
    }
    
    func toggleAppreanceOf(view: PinView, withtext: String?) {
        if passcodeConfiguration.isSecureEntry {
            view.indicator?.isHidden = false
            view.updateIndicatorApperance()
        } else {
            view.indicator?.isHidden = true
            view.pinText = withtext
        }
    }
}
