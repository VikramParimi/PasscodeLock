//
//  MHPasscodeView+Custom.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

extension MHPasscodeView: UIKeyInput {
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func becomeFirstResponder() -> Bool {
        return super.becomeFirstResponder()
    }
    
    internal var hasText: Bool {
        return !passscode.isEmpty
    }
    
    internal func insertText(_ text: String) {
        guard canInsertCharacters() else { return }
        passscode.append(text)
        
        guard let view = passcodeStackView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
                pinView.isFilled == false {
                return true
            }
            return false
        }).first as? PinView else { return }
        
        view.isFilled = true
        toggleAppreanceOf(view: view, withtext: text)
        
        if passscode.count == passcodeConfiguration.length {
            delegate?.didEnter(passscode)
        }
    }
    
    internal func deleteBackward() {
        guard hasText else { return }
            passscode.removeLast()
        
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
    
    private func canInsertCharacters() -> Bool {
        guard passscode.count == passcodeConfiguration.length else { return true }
        return false
    }
    
    private func toggleAppreanceOf(view: PinView, withtext: String?) {
        if passcodeConfiguration.isSecureEntry {
            view.indicator?.isHidden = false
            view.updateIndicatorApperance()
        } else {
            view.indicator?.isHidden = true
            view.pinText = withtext
        }
    }
}
