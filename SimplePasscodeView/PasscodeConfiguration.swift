//
//  PasscodeConfiguration.swift
//  SimplePasscodeView
//
//  Copyright © 2018 Geeko Coco. All rights reserved.
//

import Foundation

private var passcodeLength                 = 6
private var passcodeIsSecureEntry          = true
private var passcodeDefaultSpacing: Float  = 5
private var passcodeCustomSpacingPosition  = -1
private var passcodeCustomSpacing          = 20

public protocol PasscodeConfigurable {
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

