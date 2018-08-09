//
//  MHPasscodeView.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

open class MHPasscodeView: UIView, PasscodeConfigurable {

    public var passcode: MHPasscode = .other
    
    private var passcodeText: String = ""
    
    @IBOutlet private weak var passcodeView: UIStackView!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    
    open override func layoutSubviews() {
        let _ = becomeFirstResponder()
    }
    
    open override var canBecomeFirstResponder: Bool {
        return true
    }
    
    open override func becomeFirstResponder() -> Bool {
        return super.becomeFirstResponder()
    }
    
    private func updateView() {
        passcodeView.spacing      = passcode.spacing
        passcodeView.distribution = .equalSpacing
        passcodeView.alignment    = .center
        for view in passcode.placeHolderViews {
            passcodeView.addArrangedSubview(view)
        }
    }
}

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
        
        guard let view = passcodeView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
                pinView.isFilled == false {
                return true
            }
            return false
        }).first as? PinView else { return  }
        
        view.isFilled = true
        toggleAppreanceOfPinview(view, text)
    }
    
    public func deleteBackward() {
        
        guard hasText else {
            return
        }
        passcodeText.removeLast()
        
        guard let view = passcodeView.arrangedSubviews.filter({ (view) -> Bool in
            if let pinView = view as? PinView,
                pinView.isFilled == true {
                return true
            }
            return false
        }).last as? PinView else { return  }
        
        view.isFilled = false
        toggleAppreanceOfPinview(view, nil)
    }
    
    func canInsertCharacters() -> Bool {
        if passcodeText.count != passcode.length {
            return true
        }
        return false
    }
    
    func toggleAppreanceOfPinview(_ view: PinView, _ pinText: String?) {
        if passcode.secureEntry {
            view.indicator?.isHidden = false
            view.updateIndicatorApperance()
        } else {
            view.indicator?.isHidden = true
            view.pinText = pinText
        }
    }
}
