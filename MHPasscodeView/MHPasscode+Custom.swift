//
//  MHPasscode+Custom.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import Foundation

extension MHPasscode {
    var placeHolder: String {
        return String(repeating: MHPasscodeFiller.emptyCircle,
                      count: self.length)
    }
    
    var length: Int {
        get {
            switch self {
            case .accessCode:
                return 6
            case .participantId:
                return 7
            case .other:
                return 10
            }
        }
    }
    
    var kernValue: Double {
        get {
            switch self {
            case .accessCode:
                return 30
            case .participantId, .other:
                return 20
            }
        }
    }
    
    var secureEntry: Bool {
        get {
            switch self {
            case .accessCode:
                return true
            case .participantId, .other:
                return false
            }
        }
    }
    
    var insertionRegEx: String {
        get {
            return "^(.*?)\(MHPasscodeFiller.emptyCircle)"
        }
    }
    
    var deletionRegEx: String {
        get {
            switch self {
            case .accessCode:
                return "(?:.(?!\(MHPasscodeFiller.filledCircle)))"
            case .participantId, .other:
                return "(?:.(?![0-9]))"
            }
        }
    }
    
}
