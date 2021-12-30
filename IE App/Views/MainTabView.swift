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
    @State private var selection: Tab = .ProfileView

    // force-reset property
    @State private var reset = UUID()
    
    enum Tab {
        case ProfileView
        case CoursesView
        case CalendarView
        case AnnouncementsView
        case MenuView
    }
    
    var body: some View {
        
        // Function to preserve state of navigation stack unless selected tab is clicked
        let proxy = Binding(get: {selection}, set: {
                    if selection == $0 {
                        reset = UUID()     // << update if same tab clicked !!
                    }
                    selection = $0
                })
        
        TabView(selection: proxy) {
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
                }.tag(Tab.ProfileView)
            
            CoursesView()
                .tabItem {
                    VStack {
                        Image(systemName: "books.vertical")
                        Text("Courses")
                    }
                }.tag(Tab.CoursesView)
                .id(reset)
            
            CalendarView()
                .tabItem {
                    VStack {
                        Image(systemName: "calendar")
                        Text("Calendar")
                    }
                }.tag(Tab.CalendarView)
            
            AnnouncementsView()
                .tabItem {
                    VStack {
                        Image(systemName: "bell.badge")
                        Text("Announcements")
                    }
                }.tag(Tab.AnnouncementsView)
            
            MenuView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("More")
                    }
                }.tag(Tab.MenuView)
                .id(reset)
        }
        .environmentObject(UserModel()) // Create an instance of the view model as an environment object
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .previewDevice("iPhone 11")
    }
}
