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

// Passcode Appreance Defaults
private var passcodeLength                 = 6
private var passcodeIsSecureEntry          = true
private var passcodeDefaultSpacing: Float  = 5
private var passcodeCustomSpacingPosition  = -1
private var passcodeCustomSpacing          = 20

public protocol PasscodeConfigurable: PinViewConfigurable {
    var length: Int {get set}
    var isSecureEntry: Bool {get set}
    var defaultSpacing: Float {get set}
    var customSpacingPosition: Int {get set}
    var customSpacing: Int {get set}
}

public extension PasscodeConfigurable {
    var length: Int {
        get {return passcodeLength}
        set {passcodeLength =  newValue}}
    var isSecureEntry: Bool {
        get {return passcodeIsSecureEntry}
        set {passcodeIsSecureEntry =  newValue}}
    var defaultSpacing: Float {
        get {return passcodeDefaultSpacing}
        set {passcodeDefaultSpacing =  newValue}}
    var customSpacingPosition: Int {
        get {return passcodeCustomSpacingPosition}
        set {passcodeCustomSpacingPosition =  newValue}}
    var customSpacing: Int {
        get {return passcodeCustomSpacing}
        set {passcodeCustomSpacing =  newValue}}
}

