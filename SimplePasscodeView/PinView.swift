//
//  PinView.swift
///  SimplePasscodeView
//
//  Copyright © 2018 Geeko Coco. All rights reserved.
//

import UIKit

private enum PinViewDefaults {
    static let pinViewWidth: CGFloat       = 30.0
    static let pinViewHeight: CGFloat      = 40.0
    static let pinIndicatorWidth: CGFloat  = 10.0
    static let pinIndicatorHeight: CGFloat = 10.0
}

class PinView: UIView, PinViewConfigurable {
    
    private lazy var indicator = PinIndicator()
    private lazy var pinLabel  = UILabel()
    private lazy var isFilled: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: PinViewDefaults.pinViewWidth).isActive = true
        heightAnchor.constraint(equalToConstant: PinViewDefaults.pinViewHeight).isActive = true
        
        addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.widthAnchor.constraint(equalToConstant: PinViewDefaults.pinIndicatorWidth).isActive = true
        indicator.heightAnchor.constraint(equalToConstant: PinViewDefaults.pinIndicatorHeight).isActive = true
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    internal func isEmpty() -> Bool {
        return !isFilled
    }
    
    internal func update(fill: Bool, andText: String?, isSecureEntry: Bool) {
        isFilled = fill
        if isSecureEntry {
            if fill {
                indicator.fillView()
            } else {
                indicator.clearView()
            }
            
            indicator.isHidden = false
            pinLabel.isHidden  = true
        } else {
            guard let text = andText, text.count > 0 else {
                pinLabel.isHidden  = true
                indicator.isHidden = false
                return
            }
            addSubview(pinLabel)
            pinLabel.translatesAutoresizingMaskIntoConstraints = false
            pinLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            pinLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            
            pinLabel.font = pinfont
            pinLabel.textColor = pinfontColor
            pinLabel.text = andText
            
            pinLabel.isHidden  = false
            indicator.isHidden = true
        }
    }
}
