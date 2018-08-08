//
//  MHPasscodeView.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

public class MHPasscodeView: UIView {

    public var passcode: MHPasscode = .accessCode
    
    private var passcodeText: String = ""
    
    @IBOutlet private weak var passcodeLabel: UILabel!
    
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
        passcodeLabel.text = passcode.placeHolder
        passcodeLabel.updatePasscodeAppearance(kernValue: passcode.kernValue)
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
        
        let newString = passcodeLabel.text?.replacingOccurrences(of: passcode.insertionRegEx,
                                                                 with: passcode.secureEntry ? "$1\(Circle.filled)" : "$1\(text)",
                                                                 options: .regularExpression,
                                                                 range: nil)
        passcodeLabel.text = newString
        passcodeLabel.updatePasscodeAppearance(kernValue: passcode.kernValue)
    }
    
    public func deleteBackward() {
        
        guard hasText else {
            return
        }
        passcodeText.removeLast()
        
        let newString = passcodeLabel.text?.replacingOccurrences(of: passcode.deletionRegEx,
                                                                 with: "$1\(Circle.empty)",
                                                                 options: .regularExpression,
                                                                 range: nil)
        passcodeLabel.text = newString
        passcodeLabel.updatePasscodeAppearance(kernValue: passcode.kernValue)
    }
    
    func canInsertCharacters() -> Bool {
        if passcodeText.count != passcode.length {
            return true
        }
        return false
    }
}

extension UILabel {
    func updatePasscodeAppearance(kernValue: Double) {
        guard let labelText = text else { return  }
        let attributedString = NSMutableAttributedString(string: labelText)
        if let range = text?.range(of: "\\d+",
                                   options: .regularExpression,
                                   range: nil,
                                   locale: nil) {
            let length = text?.distance(from: range.lowerBound, to: range.upperBound)
            attributedString.addAttributes([.foregroundColor: UIColor.black,
                                            .font: UIFont.systemFont(ofSize: 22)],
                                           range: NSRange(location: 0, length: length!))
        }
        attributedString.addAttributes([.kern : kernValue],
                                       range: NSRange(location: 0, length: attributedString.length - 1))
        attributedText = attributedString
    }
}
