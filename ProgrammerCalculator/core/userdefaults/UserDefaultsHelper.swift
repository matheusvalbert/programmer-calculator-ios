//
//  UserDefaultsHelper.swift
//  ProgrammerCalculator
//
//  Created by Matheus Valbert on 29/03/24.
//

import Foundation

enum UserDefaultsHelper {
    
    static private let defaults = UserDefaults.standard
    
    private enum Keys {
        static let alreadyRequested = "alreadyRequested"
        static let numberOfInteractions = "numberOfInteractions"
    }
    
    static func update(value: Bool) {
        defaults.setValue(value, forKey: Keys.alreadyRequested)
    }
    
    static func update(value: Int) {
        defaults.setValue(value, forKey: Keys.numberOfInteractions)
    }
    
    static func get() -> Bool {
        return defaults.bool(forKey: Keys.alreadyRequested)
    }
    
    static func get() -> Int {
        return defaults.integer(forKey: Keys.numberOfInteractions)
    }
}
