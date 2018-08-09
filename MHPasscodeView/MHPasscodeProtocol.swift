//
//  MHPasscodeProtocol.swift
//  MHPasscodeView
//
//  Created by Pairmi, Vikram (US - Bengaluru) on 8/9/18.
//  Copyright © 2018 vikram. All rights reserved.
//

import UIKit

private enum PasscodeConfigurableConstants {
    static let paddingPosition  = -1
    static let spacing: CGFloat = 5
    static let length           = 6
    static let offset           = 10
    static let secureEntry      = false
}

public protocol PasscodeConfigurable {
    var length: Int { get set }
    var spacing: CGFloat{ get set }
    var secureEntry: Bool{ get set }
    var paddingAt: Int { get set }
    var paddingOffset: Int { get set }
}

public extension PasscodeConfigurable {
    var length: Int { get {return PasscodeConfigurableConstants.length} set {}}
    var spacing: CGFloat { get {return PasscodeConfigurableConstants.spacing} set{}}
    var secureEntry: Bool { get {return PasscodeConfigurableConstants.secureEntry} set{}}
    var paddingAt: Int { get {return PasscodeConfigurableConstants.paddingPosition} set{}}
    var paddingOffset: Int { get {return PasscodeConfigurableConstants.offset} set{}}
}

