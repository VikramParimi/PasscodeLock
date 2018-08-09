//
//  MHPasscodeProtocol.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

private enum PasscodeConfigurableConstants {
    static let paddingPosition  = -1
    static let spacing: CGFloat = 5
    static let length           = 6
    static let offset           = 10
    static let isSecureEntry    = true
}

public protocol PasscodeConfigurable {
    var length: Int { get set }
    var spacing: CGFloat{ get set }
    var isSecureEntry: Bool{ get set }
    var paddingAt: Int { get set }
    var paddingOffset: Int { get set }
}

public extension PasscodeConfigurable {
    var length: Int { get {return PasscodeConfigurableConstants.length} set {}}
    var spacing: CGFloat { get {return PasscodeConfigurableConstants.spacing} set{}}
    var isSecureEntry: Bool { get {return PasscodeConfigurableConstants.isSecureEntry} set{}}
    var paddingAt: Int { get {return PasscodeConfigurableConstants.paddingPosition} set{}}
    var paddingOffset: Int { get {return PasscodeConfigurableConstants.offset} set{}}
}

public protocol PinViewConfigurable: PasscodeConfigurable {
    var isSecureEntry: Bool { get set }
}

extension PinViewConfigurable {
    var isSecureEntry: Bool { get {return isSecureEntry} set {}}
    var isFilled: Bool { get {return false} set {}}
}
