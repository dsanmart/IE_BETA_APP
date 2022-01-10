//
//  MenuView.swift
//  IE App
//
//  Created by Diego Sanmartin on 22/12/2021.
//


import SwiftUI

struct MenuView: View {
    
    // Set variables and timer that triggers itself for the automatic sliding of the banners
    private let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    private var numberOfImages = 3
    @State private var currentIndex = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geo in
                    ScrollView {
                        TabView(selection: $currentIndex) {
                            Image("cafeteria_banner")
                                .resizable()
                                .scaledToFill()
                                .tag(0)
                            Image("ie_perks_banner")
                                .resizable()
                                .scaledToFill()
                                .tag(1)
                            Image("ie_shop_banner")
                                .resizable()
                                .scaledToFill()
                                .tag(2)
                        }.tabViewStyle(PageTabViewStyle())
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.horizontal)
                            .frame(width: geo.size.width, height: 200)
                            .padding(.top, 100)
                            .onReceive(timer, perform: { _ in withAnimation { currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0}})
                        
                        LazyVGrid(columns:[GridItem(.adaptive(minimum: geo.size.width / 4 - 20))], alignment: .center, spacing:25) {
                            
                            // Group views are used to work around the 10-child view limit
                            MenuItems1()
                            MenuItems2()

                        }.padding(.horizontal)
                            .padding(.top)
                        
                    }.navigationBarHidden(true)
                    
                    // MARK: Dot with title
                    Rectangle()
                        .foregroundColor(Color.white.opacity(0.8))
                        .frame(width: geo.size.width, height: 90)
                        .blur(radius:10)
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
            }
        }.navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct MenuItems1: View {
    var body: some View {
        Group {
            NavigationLink(destination: UndoneView()) {
                
                VStack(alignment: .center) {
                    Image(systemName: "person.3.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("Clubs")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: UndoneView()) {
                
                VStack {
                    Image(systemName: "character.book.closed")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("Grades")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: UndoneView()) {
                
                VStack {
                    Image(systemName: "cup.and.saucer.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("Cafeteria")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: UndoneView()) {
                
                VStack {
                    Image(systemName: "text.bubble")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("Messages")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: StoreWebView()) {
                
                VStack {
                    Image(systemName: "cart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("IE Store")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: PerksWebView()) {
                
                VStack {
                    Image(systemName: "percent")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 28)
                        .padding(.bottom, 4)
                    Text("IE Perks")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: UndoneView()) {
                
                VStack {
                    Image(systemName: "calendar.badge.exclamationmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("Events")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: CovidWebView()) {
                
                VStack {
                    Image(systemName: "facemask.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("Covid Tracer")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: LibraryWebView()) {
                
                VStack {
                    Image(systemName: "building.columns.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("Library")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: BookingWebView()) {
                
                VStack {
                    Image(systemName: "key.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("Booking")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
        }
    }
}

struct MenuItems2: View {
    var body: some View {
        Group {
            NavigationLink(destination: AthleticsWebView()) {
                
                VStack {
                    Image(systemName: "sportscourt")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 27)
                        .padding(.bottom, 5)
                    Text("IE Athletic")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: CareerWebView()) {
                
                VStack {
                    Image(systemName: "studentdesk")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("Career Portal")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: UndoneView()) {
                
                VStack {
                    Image(systemName: "map.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("IE Maps")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
            NavigationLink(destination: SettingsView()) {
                
                VStack {
                    Image(systemName: "gear")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 30)
                        .padding(.bottom, 2)
                    Text("Settings")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }.buttonStyle(.plain)
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
