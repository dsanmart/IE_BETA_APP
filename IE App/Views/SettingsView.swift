//
//  SettingsView.swift
//  IE App
//
//  Created by Diego Sanmartin on 22/12/2021.
//
// Link on reseting navigation stack when switching tabs
// https://coderedirect.com/questions/157201/tabview-resets-navigation-stack-when-switching-tabs
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geo in
                    // MARK: Dot with title
                    Rectangle()
                        .foregroundColor(Color(UIColor.systemGray6))
                    Ellipse()
                        .fill(Color.blue)
                        .frame(width: geo.size.width*2, height: geo.size.width*2, alignment: .center)
                        .ignoresSafeArea()
                        .position(x: geo.size.width/2, y: 80-geo.size.width)
                    
                    Text("Settings")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .position(x: geo.size.width/2)
                        .padding(.top, 30)
                }

                List {
                    NavigationLink(destination: UndoneView()) {
                        
                        HStack {
                            Image(systemName: "bubble.left.and.exclamationmark.bubble.right.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            
                            Text("Feedback")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: UndoneView()) {
                        
                        HStack {
                            Image(systemName: "checkmark.shield.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("Privacy Policy")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: UndoneView()) {
                        
                        HStack {
                            Image(systemName: "faceid")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("Face ID")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: UndoneView()) {
                        
                        HStack {
                            Image(systemName: "link")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("Institution Policy")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: UndoneView()) {
                        
                        HStack {
                            Image(systemName: "bell.badge.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("Notifications")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: UndoneView()) {
                        
                        HStack {
                            Image(systemName: "square.dashed")
                                .resizable()
                                .frame(width: 35, height:35)
                            Text("Widgets")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    
                    Button(action: {
                        authentication.updateValidation(success: false)
                    }) {
                        HStack {
                            Image(systemName: "arrowshape.turn.up.backward.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("Log Out")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                }.padding(.top, 80)
            }.navigationBarHidden(true)
        }.navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
