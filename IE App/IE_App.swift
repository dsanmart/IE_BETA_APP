//
//  IE_AppApp.swift
//  IE App
//
//  Created by Diego Sanmartin on 20/12/2021.
//

import SwiftUI

@main
struct IE_App: App {
    @StateObject var authentication = Authentication()
    var body: some Scene {
        WindowGroup {
            if !authentication.isValidated {
                LoginView()
                    .environmentObject(authentication)
            } else {
                MainTabView()
                    .environmentObject(authentication)
            }
        }
    }
}
