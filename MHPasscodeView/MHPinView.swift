//
//  MHPasscode+Custom.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

class PinView: UIView, PinViewConfigurable {
    
    var indicator: Indicator? {
        didSet {
            guard let view = indicator else { return }
            addSubview(view)
        }
    }
    var pinText: String? {
        didSet {
            guard let pinText = pinText else {
                pinLabel.isHidden = true
                indicator?.isHidden = false
                return
            }
            updateLabelApperance(pinText)
        }
    }
    
    private lazy var pinLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func updateIndicatorApperance() {
        if isFilled {
            indicator?.fillView()
        } else {
            indicator?.clearView()
        }
    }
    
    func updateLabelApperance(_ pinText: String) {
        pinLabel.font = UIFont.systemFont(ofSize: 22)
        pinLabel.textColor = UIColor.black
        pinLabel.text = pinText
        addSubview(pinLabel)
        pinLabel.isHidden = false
        
        pinLabel.translatesAutoresizingMaskIntoConstraints = false
        pinLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pinLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

class Indicator: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        rounded()
    }
}

extension Indicator {
    func rounded() {
        layer.cornerRadius = frame.width / 2
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func clearView() {
        backgroundColor = UIColor.clear
    }
    
    func fillView() {
        backgroundColor = UIColor.lightGray
    }
}
