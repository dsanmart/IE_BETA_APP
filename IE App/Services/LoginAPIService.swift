//
//  APIService.swift
//  My Secure App
//
//  Created by Diego Sanmartin on 29/12/2021.
//

import Foundation
import SwiftUI

class LoginAPIService {
    static let shared = LoginAPIService()
    var model:UserModel = UserModel()
    
    var usernames:[String] = []
    var passwords:[String] = []
    init() {
        for usr in model.users {
            usernames.append(usr.id)
            passwords.append(usr.password)
        }
    }
    
    func login(credentials: Credentials,
               completion: @escaping (Result<Bool,Authentication.AuthenticationError>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if self.usernames.contains(credentials.email) {
                let userIndex = self.usernames.firstIndex(of: credentials.email)
                if self.passwords[userIndex!] == credentials.password {
                    completion(.success(true))
                    print("Succesfully Logged In. User: " + String(userIndex!))
                } else {
                    completion(.failure(.invalidCredentials))
                }
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
        
    }
    
    func index(credentials: Credentials) -> Int {
        if self.usernames.contains(credentials.email) {
            let userIndex = self.usernames.firstIndex(of: credentials.email)
            if self.passwords[userIndex!] == credentials.password {
                return userIndex!
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
}
