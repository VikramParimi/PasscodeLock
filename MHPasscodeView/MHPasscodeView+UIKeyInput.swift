//
//  MHPasscodeView+UIKeyInput.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

extension MHPasscodeView: UIKeyInput {
    
    internal override var canBecomeFirstResponder: Bool {
        return true
    }
    
    internal override func becomeFirstResponder() -> Bool {
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
               pinView.isEmpty() {
                return true
            }
            return false
        }).first as? PinView else { return }
        
        view.update(fill: true, andText: text, isSecureEntry: passcodeConfiguration.isSecureEntry)
        
        if passscode.count == passcodeConfiguration.length {
            delegate?.didEnter(passscode)
        }
    }
    
    internal func deleteBackward() {
        guard hasText else { return }
            passscode.removeLast()
        
        guard let view = passcodeStackView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
               !pinView.isEmpty() {
                return true
            }
            return false
        }).last as? PinView else { return  }
        
        view.update(fill: false, andText: nil, isSecureEntry: passcodeConfiguration.isSecureEntry)
    }
    
    private func canInsertCharacters() -> Bool {
        guard passscode.count == passcodeConfiguration.length else { return true }
        return false
    }
}
