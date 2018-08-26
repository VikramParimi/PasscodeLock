//
//  PasscodeConfiguration.swift
//  SimplePasscodeView
//
//  Copyright © 2018 Geeko Coco. All rights reserved.
//

import UIKit

// Pin Appreance Defaults
private var font                 = UIFont.systemFont(ofSize: 22)
private var fontColor            = UIColor.black
private var borderColor          = UIColor.lightGray.cgColor
private var fillColor            = UIColor.lightGray

public protocol PinViewConfigurable {
    var pinfont: UIFont {get set}
    var pinfontColor: UIColor {get set}
    var pinborderColor: CGColor {get set}
    var pinfillColor: UIColor {get set}
}

public extension PinViewConfigurable {
    var pinfont: UIFont {
        get {return font}
        set {font =  newValue}}
    var pinfontColor: UIColor {
        get {return fontColor}
        set {fontColor =  newValue}}
    var pinborderColor: CGColor {
        get {return borderColor}
        set {borderColor =  newValue}}
    var pinfillColor: UIColor {
        get {return fillColor}
        set {fillColor =  newValue}}
}

