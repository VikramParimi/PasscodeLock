//
//  PasscodeConfiguration.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import Foundation

private enum PasscodeConfigurationDefaults {
    static let length                  = 6
    static let isSecureEntry           = false
    static let defaultSpacing: Float   = 5
    static let customSpacingPosition   = 2
    static let customSpacing           = 20
}

public struct PasscodeConfiguration {
    let length: Int
    let isSecureEntry: Bool
    let defaultSpacing: Float
    let customSpacingPosition: Int
    let customSpacing: Int
    
    public init() {
        self.length                = PasscodeConfigurationDefaults.length
        self.isSecureEntry         = PasscodeConfigurationDefaults.isSecureEntry
        self.defaultSpacing        = PasscodeConfigurationDefaults.defaultSpacing
        self.customSpacingPosition = PasscodeConfigurationDefaults.customSpacingPosition
        self.customSpacing         = PasscodeConfigurationDefaults.customSpacing
    }
    
    public init(length: Int, isSecureEntry: Bool, defaultSpacing: Float? , customSpacingPosition: Int?, customSpacing: Int?) {
        self.length                = length
        self.isSecureEntry         = isSecureEntry
        self.defaultSpacing        = defaultSpacing ?? PasscodeConfigurationDefaults.defaultSpacing
        self.customSpacingPosition = customSpacingPosition ?? PasscodeConfigurationDefaults.customSpacingPosition
        self.customSpacing         = customSpacing ?? PasscodeConfigurationDefaults.customSpacing
    }
}
