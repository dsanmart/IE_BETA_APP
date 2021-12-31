//
//  LocalStorage.swift
//  IE App
//
//  Created by Diego Sanmartin on 31/12/2021.
//

import Foundation

class LocalStorage {
    private static var myKey: String = "beta"
    
    public static var user: String {
        set {
            UserDefaults.standard.set(newValue, forKey: myKey)
        } get {
            return UserDefaults.standard.string(forKey: myKey) ?? ""
        }
    }
}
