//
//  ContentView.swift
//  IE App
//
//  Created by Diego Sanmartin on 20/12/2021.
//

import SwiftUI

struct MainTabView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray6
    }
    var body: some View {
        
        TabView {
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                }
            
            CoursesView()
                .tabItem {
                    VStack {
                        Image(systemName: "books.vertical")
                        Text("Courses")
                    }
                }
            
            CalendarView()
                .tabItem {
                    VStack {
                        Image(systemName: "calendar")
                        Text("Calendar")
                    }
                }
            
            AnnouncementsView()
                .tabItem {
                    VStack {
                        Image(systemName: "bell.badge")
                        Text("Announcements")
                    }
                }
            
            MenuView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("More")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .previewDevice("iPhone 11")
    }
}
