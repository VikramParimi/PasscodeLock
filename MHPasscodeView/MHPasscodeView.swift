//
//  MHPasscodeView.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

public enum MHPasscode {
    case accessCode
    case participantId
    case other
}

enum MHPasscodeFiller {
    static let emptyCircle  = "○"
    static let filledCircle = "●"
}

public class MHPasscodeView: UIView {
    
    public var passcode: MHPasscode = .participantId
    
    private var passcodeText: String?
    private var secureEntry: Bool = false
    
    @IBOutlet private weak var passcodeLabel: UILabel!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        createPasscodePlaceHolder()
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
    
    private func createPasscodePlaceHolder() {
        passcodeLabel.text = passcode.placeHolder
        passcodeLabel.addCharacterSpacing(kernValue: passcode.kernValue)
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
        if let text = passcodeText {
            return !text.isEmpty
        }
        return false
    }

    public func insertText(_ text: String) {
        let newString = passcodeLabel.text?.replacingOccurrences(of: passcode.insertionRegEx,
                                                                 with: passcode.secureEntry ? "$1\(MHPasscodeFiller.filledCircle)" : "$1\(text)",
                                                                 options: .regularExpression,
                                                                 range: nil)
        passcodeLabel.text = newString
        passcodeLabel.addCharacterSpacing(kernValue: passcode.kernValue)
    }
    
    public func deleteBackward() {
        let newString = passcodeLabel.text?.replacingOccurrences(of: passcode.deletionRegEx,
                                                                 with: "$1\(MHPasscodeFiller.emptyCircle)",
                                                                 options: .regularExpression,
                                                                 range: nil)
        passcodeLabel.text = newString
        passcodeLabel.addCharacterSpacing(kernValue: passcode.kernValue)
    }
}

extension UILabel {
    func addCharacterSpacing(kernValue: Double) {
        let attributedString = NSMutableAttributedString(string: text!)
        attributedString.addAttributes([.kern : kernValue], range: NSRange(location: 0, length: attributedString.length - 1))
        attributedText = attributedString
    }
}
