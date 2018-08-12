//
//  MHPasscodeView+UIKeyInput.swift
//  SimplePasscodeView
//
//  Copyright © 2018 Geeko Coco. All rights reserved.
//

import UIKit

extension SimplePasscodeView: UIKeyInput {
    
    override public var canBecomeFirstResponder: Bool {
        return true
    }
    
    override public func becomeFirstResponder() -> Bool {
        return super.becomeFirstResponder()
    }
    
    public var hasText: Bool {
        return !passscodeText.isEmpty
    }
    
    public func insertText(_ text: String) {
        guard canInsertCharacters() else { return }
        passscodeText.append(text)
        
        guard let view = passcodeStackView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
                pinView.isEmpty() {
                return true
            }
            return false
        }).first as? PinView else { return }
        
        view.update(fill: true, andText: text, isSecureEntry: isSecureEntry)
        
        if passscodeText.count == length {
            delegate?.didEnter(passscodeText)
        }
    }
    
    public func deleteBackward() {
        guard hasText else { return }
        passscodeText.removeLast()
        
        guard let view = passcodeStackView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
                !pinView.isEmpty() {
                return true
            }
            return false
        }).last as? PinView else { return  }
        
        view.update(fill: false, andText: nil, isSecureEntry: isSecureEntry)
    }

    private func canInsertCharacters() -> Bool {
        guard passscodeText.count == length else { return true }
        return false
    }
}
