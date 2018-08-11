//
//  MHPasscodeConfiguration.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import Foundation

private enum PasscodeConfigurationDefaults {
    static let length                  = 6
    static let isSecureEntry           = true
    static let defaultSpacing: Float   = 5
    static let customSpacing           = 20
    static let paddingPosition         = -1
}

public struct PasscodeConfiguration {
    let length: Int
    let isSecureEntry: Bool
    let paddingPosition: Int
    let defaultSpacing: Float
    let customSpacing: Int
    
    public init() {
        self.length          = PasscodeConfigurationDefaults.length
        self.isSecureEntry   = PasscodeConfigurationDefaults.isSecureEntry
        self.paddingPosition = PasscodeConfigurationDefaults.paddingPosition
        self.defaultSpacing  = PasscodeConfigurationDefaults.defaultSpacing
        self.customSpacing   = PasscodeConfigurationDefaults.customSpacing
    }
    
    public init(length: Int, isSecureEntry: Bool, paddingPosition: Int?, defaultSpacing: Float?, customSpacing: Int?) {
        self.length          = length
        self.isSecureEntry   = isSecureEntry
        self.paddingPosition = paddingPosition ?? PasscodeConfigurationDefaults.paddingPosition
        self.defaultSpacing  = defaultSpacing ?? PasscodeConfigurationDefaults.defaultSpacing
        self.customSpacing   = customSpacing ?? PasscodeConfigurationDefaults.customSpacing
    }
}
