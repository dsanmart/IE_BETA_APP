//
//  UserModel.swift
//  IE App
//
//  Created by Diego Sanmartin on 24/12/2021.
//

import Foundation

class UserModel: ObservableObject {
    
    @Published var user = [User]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.user = DataService.getlocaldata()
    }
}
