//
//  MenuView.swift
//  IE App
//
//  Created by Diego Sanmartin on 22/12/2021.
//


import SwiftUI

struct MenuView: View {
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
                    
                    Text("Menu")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .position(x: geo.size.width/2)
                        .padding(.top, 30)
                }

                List {
                    NavigationLink(destination: SettingsView()) {
                        
                        HStack {
                            Image(systemName: "building.columns.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("Institution Page")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: SettingsView()) {
                        
                        HStack {
                            Image(systemName: "person.3.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("Clubs")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: SettingsView()) {
                        
                        HStack {
                            Image(systemName: "text.bubble")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("Messages")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: SettingsView()) {
                        
                        HStack {
                            Image(systemName: "cup.and.saucer.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("Cafeteria")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: SettingsView()) {
                        
                        HStack {
                            Image(systemName: "cart.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("IE Shop")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: SettingsView()) {
                        
                        HStack {
                            Image(systemName: "percent")
                                .resizable()
                                .frame(width: 30)
                                .padding(.leading, 5)
                            Text("IE Perks")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: SettingsView()) {
                        
                        HStack {
                            Image(systemName: "facemask.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("Covid Tracer App")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                    NavigationLink(destination: SettingsView()) {
                        
                        HStack {
                            Image(systemName: "gear")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height:35)
                            Text("Settings")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading, 10.0)
                        }.padding(.vertical, 5)
                    }
                }.navigationBarHidden(true)
                .padding(.top, 90)
            }
        }.navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
