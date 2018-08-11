//
//  PinIndicator.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

internal class Indicator: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        rounded()
    }
}

internal extension Indicator {
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
