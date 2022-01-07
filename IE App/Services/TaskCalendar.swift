//
//  TaskCalendar.swift
//  IE App
//
//  Created by rayane mazari on 29/12/21.
//

import SwiftUI

// tasl Mode and Sample Tasks...
//Task model and sample
struct TaskCalendar: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}
// Total task meta view...
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [TaskCalendar]
    var taskDate: Date
}
//sample date for testing...
func getSampleDate(offset: Int)->Date{
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}


var tasks: [TaskMetaData] = [
    
    TaskMetaData(task: [
        TaskCalendar(title: "Calculus for Computer Science (Ses. 1) T-20.1"),
        TaskCalendar(title: "Designing and Using Databases (Ses. 2) T-20.1"),
        TaskCalendar(title: "Problem Set 3")
    ], taskDate: getSampleDate(offset: 0)),
    TaskMetaData(task: [
        TaskCalendar(title: "Midterm Algorithms & Databases")
    ], taskDate: getSampleDate(offset: 23)),
    TaskMetaData(task: [
        TaskCalendar(title: "Calculus Final Exam")
    ], taskDate: getSampleDate(offset: 30)),
    TaskMetaData(task: [
        TaskCalendar(title: "Designing and Using Databases (Ses. 2) T-21.5"),
        TaskCalendar(title: "Asynchronous TeamWork 2")
    ], taskDate: getSampleDate(offset: 28)),
    TaskMetaData(task: [
        TaskCalendar(title: "Asynchronous TeamWork 1: Technology")
    ], taskDate: getSampleDate(offset: 22)),
    TaskMetaData(task: [
        TaskCalendar(title: "Midterm Algorithms & Databases")
    ], taskDate: getSampleDate(offset: 15)),
    TaskMetaData(task: [
        TaskCalendar(title: "Designing and Using Databases (Ses. 2) T-21.5")
    ], taskDate: getSampleDate(offset: -4))
]
