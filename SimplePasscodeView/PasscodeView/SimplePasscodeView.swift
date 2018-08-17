//
//  MHPasscodeView.swift
//  SimplePasscodeView
//
//  Copyright © 2018 Geeko Coco. All rights reserved.
//

import UIKit

public protocol SimplePasscodeDelegate: class {
    func didFinishEntering(_ passcode: String)
}

public class SimplePasscodeView: UIView {
    
    @IBOutlet private weak var passcodeStackView: UIStackView!
    
    private var contentView: UIView?
    private var passscodeText = String()
    
    public weak var delegate: SimplePasscodeDelegate?
    public var keyboardType: UIKeyboardType = .default

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    private func setup() {
        if (contentView == nil) {
            contentView = loadViewFromNib()
            contentView?.frame = bounds
            guard let view = contentView else {return}
            addSubview(view)
            
            let _ = becomeFirstResponder()
            setupPasscodeStackView()
        }
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

extension SimplePasscodeView: PasscodeConfigurable {
    
    private func setupPasscodeStackView() {
        placeHolderViews.forEach { (view) in
            passcodeStackView.addArrangedSubview(view)
        }
        passcodeStackView.spacing = CGFloat(length)
        
        passcodeStackView.translatesAutoresizingMaskIntoConstraints = false
        passcodeStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passcodeStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        guard 0..<length ~= customSpacingPosition else { return }
        passcodeStackView.distribution = .fill
        passcodeStackView.setCustomSpacing(CGFloat(customSpacing),
                                           after: passcodeStackView.arrangedSubviews[customSpacingPosition])
    }
    
    private var placeHolderViews: [PinView] {
        var views = [PinView]()
        for _ in 0..<length {
            let pinView: PinView = PinView()
            views.append(pinView)
        }
        return views
    }
}

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
            delegate?.didFinishEntering(passscodeText)
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
        return passscodeText.count != length
    }
}
