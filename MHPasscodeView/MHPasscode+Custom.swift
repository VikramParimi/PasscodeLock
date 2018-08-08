//
//  MHPasscode+Custom.swift
//  MHPasscodeView
//
//  Copyright © 2018 vikram. All rights reserved.
//

import Foundation

public enum MHPasscode {
    case accessCode
    case participantId
    case other
}

enum Circle {
    static let empty  = "○"
    static let filled = "●"
}

extension MHPasscode {
    var placeHolder: String {
        return String(repeating: Circle.empty,
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
            return "^(.*?)\(Circle.empty)"
        }
    }
    
    var deletionRegEx: String {
        get {
            switch self {
            case .accessCode:
                return "(?:.(?!\(Circle.filled)))"
            case .participantId, .other:
                return "(?:.(?![0-9]))"
            }
        }
    }
    
}
