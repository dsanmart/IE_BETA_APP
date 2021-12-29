//
//  UserModel.swift
//  IE App
//
//  Created by Diego Sanmartin on 24/12/2021.
//

import Foundation

class UserModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.users = DataService.getlocaldata()
    }
}
