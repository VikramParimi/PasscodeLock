//
//  MHPasscodeView.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

private enum PasscodeDefaults {
    static let paddingPosition  = -1
    static let spacing: CGFloat = 5
    static let length           = 6
    static let offset           = 10
    static let isSecureEntry    = false
}

public struct Passcode {
    var length: Int
    var isSecureEntry: Bool
    var paddingPosition: Int
    var spacing: CGFloat
    var offset: Int
    
    public init() {
        self.length =  PasscodeDefaults.length
        self.isSecureEntry = PasscodeDefaults.isSecureEntry
        self.paddingPosition = PasscodeDefaults.paddingPosition
        self.spacing = PasscodeDefaults.spacing
        self.offset = PasscodeDefaults.offset
    }
    
    public init(length: Int, isSecureEntry: Bool, paddingPosition: Int?, spacing: CGFloat?, offset: Int?) {
        self.length          = length
        self.isSecureEntry   = isSecureEntry
        self.paddingPosition = paddingPosition ?? PasscodeDefaults.paddingPosition
        self.spacing         = spacing ?? PasscodeDefaults.spacing
        self.offset          = offset ?? PasscodeDefaults.offset
    }
}

open class MHPasscodeView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var passcodeStackView: UIStackView!
    
    var passcode: Passcode = Passcode() {
        didSet {
            setupPasscodeStackView()
        }
    }
    var passcodeText = String()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func setup() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,
                                 UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
        
        let _ = becomeFirstResponder()
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    open override var canBecomeFirstResponder: Bool {
        return true
    }
    
    open override func becomeFirstResponder() -> Bool {
        return super.becomeFirstResponder()
    }
}

extension MHPasscodeView {
    private var placeHolderViews: [PinView] {
        var views = [PinView]()
        for _ in 0..<passcode.length {
            let pinView: PinView = PinView()
            pinView.isSecureEntry = passcode.isSecureEntry
            
            pinView.translatesAutoresizingMaskIntoConstraints = false
            pinView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            pinView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            pinView.indicator = Indicator()
            pinView.indicator?.translatesAutoresizingMaskIntoConstraints = false
            pinView.indicator?.widthAnchor.constraint(equalToConstant: 10).isActive = true
            pinView.indicator?.heightAnchor.constraint(equalToConstant: 10).isActive = true
            pinView.indicator?.centerXAnchor.constraint(equalTo: pinView.centerXAnchor).isActive = true
            pinView.indicator?.centerYAnchor.constraint(equalTo: pinView.centerYAnchor).isActive = true
            
            views.append(pinView)
        }
        return views
    }
    
    private func setupPasscodeStackView() {
        placeHolderViews.forEach { (view) in
            passcodeStackView.addArrangedSubview(view)
        }
        passcodeStackView.spacing      = passcode.spacing
    }
}
