//
//  User.swift
//  IE App
//
//  Created by Diego Sanmartin on 22/12/2021.
//

import Foundation

struct User: Decodable, Identifiable {
    var id: String = "" // This is the username
    var password: String = ""
    var covidTracerData: CovidTracer = CovidTracer()
    var blackboardData: BlackboardData = BlackboardData()
}

struct CovidTracer: Decodable, Identifiable {
    var passport: String = ""
    var id: String {passport} // This is the passport/id
    var status: String = ""
    var reason: String = ""
    var dateAccessed: String = ""
    var timeAccessed: String = ""
}

struct BlackboardData: Decodable, Identifiable {
    var studentId: String = "" // This is the student ID
    var id: String {studentId}
    var image: String = ""
    var name: String = ""
    var courses: [Course] = [Course]()
}

struct Course: Decodable, Identifiable {
    var id: Int?
    var title: String = ""
    var quarter: Int?
    var image: String = ""
    var instructor:String = ""
    var roster: [Roster] = [Roster]()
    var attendance: [Attendance] = [Attendance]()
    var announcements: [Announcement] = [Announcement]() // Content structure has to be thought properly in order to support folders or wait to know how blackboard does it
    var assignment: [Assignment] = [Assignment]()
}

struct Roster: Decodable, Identifiable {
    var id:UUID?
    var name: String = ""
    var category: String = ""
    var image: String = ""
}

struct Attendance: Decodable, Identifiable {
    var id:UUID?
    var meeting: String = ""
    var status: String = ""
    var grade: Int
}

struct Announcement: Decodable, Identifiable {
    var id:UUID?
    var date: String = ""
    var time: String = ""
    var title: String = ""
    var content: String = ""
}

struct Assignment: Decodable, Identifiable {
    var id:UUID?
    var item: String = ""
    var date: String = ""
    var time: String = ""
    var status: String = ""
    var grade: String = ""
    var feedback: String = ""
}
