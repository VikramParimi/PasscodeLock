//
//  MHPasscodeView.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

public enum MHPasscodeType {
    case accessCode
    case participantId
    case other
}

private enum MHPasscodeLength: Int {
    case accessCode    = 6
    case participantId = 7
    case other         = 10
}

private enum MHPasscodeKernValue: Double {
    case accessCode    = 30
    case participantId = 20
}

private enum MHPasscodePlaceHolder {
    static let emptyCircle  = "○"
    static let filledCircle = "●"
}

public class MHPasscodeView: UIView {
    
    public var type: MHPasscodeType = .accessCode
    
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
        passcodeText = String(repeating: MHPasscodePlaceHolder.emptyCircle,
                              count: MHPasscodeLength.accessCode.rawValue)
        
        passcodeLabel.text = passcodeText
        passcodeLabel.addCharacterSpacing(kernValue: MHPasscodeKernValue.accessCode.rawValue)
        
        switch type {
        case .accessCode:
            break
        case .participantId:
            break
        case .other:
            break
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
        if let text = passcodeText {
            return !text.isEmpty
        }
        return false
    }

    public func insertText(_ text: String) {
        let insertionRegEX = "^(.*?)\(MHPasscodePlaceHolder.emptyCircle)"
        let newString = passcodeLabel.text?.replacingOccurrences(of: insertionRegEX,
                                                                 with: "$1\(MHPasscodePlaceHolder.filledCircle)",
                                                                 options: .regularExpression,
                                                                 range: nil)
        passcodeLabel.text = newString
        passcodeLabel.addCharacterSpacing(kernValue: MHPasscodeKernValue.accessCode.rawValue)
    }
    
    public func deleteBackward() {
        var deletionRegEX = ""
        
        if type == .accessCode {
            deletionRegEX = "(?:.(?!\(MHPasscodePlaceHolder.filledCircle)))"
        } else {
            deletionRegEX = "(?:.(?![0-9]))"
        }
        
        let newString = passcodeLabel.text?.replacingOccurrences(of: deletionRegEX,
                                                                 with: "$1\(MHPasscodePlaceHolder.filledCircle)",
                                                                 options: .regularExpression,
                                                                 range: nil)
        passcodeLabel.text = newString
        passcodeLabel.addCharacterSpacing(kernValue: MHPasscodeKernValue.accessCode.rawValue)
    }
}

extension UILabel {
    func addCharacterSpacing(kernValue: Double) {
        let attributedString = NSMutableAttributedString(string: text!)
        attributedString.addAttributes([.kern : kernValue], range: NSRange(location: 0, length: attributedString.length - 1))
        attributedText = attributedString
    }
}
