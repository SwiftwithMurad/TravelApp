//
//  UserDefaultsManager.swift
//  TravelApp
//
//  Created by Mac on 01.01.25.
//

import Foundation

class UserDefaultsManager {
    enum UserDefaultsTypes: String {
        case isLoggedIn = "isLoggedIn"
        case email = "email"
    }
    
    func setValue(value: Any, key: UserDefaultsTypes) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func getBool(key: UserDefaultsTypes) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
}
