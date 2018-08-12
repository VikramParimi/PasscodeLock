//
//  MHPasscodeView.swift
//  SimplePasscodeView
//
//  Copyright © 2018 Geeko Coco. All rights reserved.
//

import UIKit

public protocol SimplePasscodeDelegate: class {
    func didEnter(_ passcode: String)
}

public class SimplePasscodeView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var passcodeStackView: UIStackView!
    
    public weak var delegate: SimplePasscodeDelegate?
    
    public var keyboardType: UIKeyboardType = .default
    internal var passscodeText = String()

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
        
        let _ = becomeFirstResponder()
        setupPasscodeStackView()
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
