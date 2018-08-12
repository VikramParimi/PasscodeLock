//
//  PasscodeConfiguration.swift
//  SimplePasscodeView
//
//  Copyright © 2018 Geeko Coco. All rights reserved.
//

import Foundation

public struct Passcode {
    var length                  = 6
    var isSecureEntry           = true
    var defaultSpacing: Float   = 5
    var customSpacingPosition   = -1
    var customSpacing           = 20
}

public protocol SimplePasscodable {
    var passcode: Passcode {get set}
}

public protocol PasscodeConfigurable: SimplePasscodable {
    var length: Int {get set}
    var isSecureEntry: Bool {get set}
    var defaultSpacing: Float {get set}
    var customSpacingPosition: Int {get set}
    var customSpacing: Int {get set}
}

public extension PasscodeConfigurable {
    var passcode: Passcode {
        get {return Passcode()}
        set {passcode = newValue}}
    var length: Int {
        get {return passcode.length}
        set {passcode.length =  newValue}}
    var isSecureEntry: Bool {
        get {return passcode.isSecureEntry}
        set {passcode.isSecureEntry =  newValue}}
    var defaultSpacing: Float {
        get {return passcode.defaultSpacing}
        set {passcode.defaultSpacing =  newValue}}
    var customSpacingPosition: Int {
        get {return passcode.customSpacingPosition}
        set {passcode.customSpacingPosition =  newValue}}
    var customSpacing: Int {
        get {return passcode.customSpacing}
        set {passcode.customSpacing =  newValue}}
}

