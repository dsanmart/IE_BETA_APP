//
//  CalendarUserModel.swift
//  IE App
//
//  Created by rayane mazari on 28/12/21.
//

import Foundation

//Date value Model...
struct CalendarUserModel: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
