//
//  CoursesView.swift
//  IE App
//
//  Created by Diego Sanmartin on 20/12/2021.
//

import SwiftUI

struct CoursesView: View {
    
    @State var selectedQuarter = 3
    
    // Reference the view model
    @EnvironmentObject var model:UserModel
    
    let getIndex = LoginAPIService()
    var userIndex: Int {
        get {
            return getIndex.index()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    GeometryReader { geo in
                        // MARK: Dot with title
                        Ellipse()
                            .fill(SwiftUI.Color("LightBlue"))
                            .frame(width: geo.size.width*2, height: geo.size.width*2, alignment: .center)
                            .ignoresSafeArea()
                            .position(x: geo.size.width/2, y: 80-geo.size.width)
                        
                        Text("Courses")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .position(x: geo.size.width/2)
                            .padding(.top, 30)
                        
                    
                        // MARK: Quarter Picker
                        Picker("", selection: $selectedQuarter) {
                            Text("All").tag(3)
                            Text("Q1").tag(1)
                            Text("Q2").tag(2)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width:geo.size.width-60)
                        .position(x: geo.size.width/2,y: 120)
                    }

                    ScrollView(.vertical, showsIndicators: false) {
                        
                            
                        LazyVStack(alignment: .center, spacing: 0) {
                            
                            // Make a variable with the corresponding logged in user
                            let user = model.users[userIndex]
                            
                            ForEach(user.blackboardData.courses) { course in
                                
                                if selectedQuarter == 1 && course.quarter == 1 {
                                    NavigationLink(destination: CourseDetailView(course: course)) {
                                        GeometryReader { geo in
                                            
                                            HStack {
                                                Spacer()
                                                CourseCardView(course: course)
                                                    .frame(width: geo.size.width - 20, height: 200)
                                                    .cornerRadius(15)
                                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: 2, y: 5)
                                                Spacer()
                                            }
                                        }
                                        .frame(height:200)
                                    }.padding(.top,25)
                                } else if selectedQuarter == 2 && course.quarter == 2 {
                                    NavigationLink(destination: CourseDetailView(course: course)) {
                                        GeometryReader { geo in
                                            
                                            HStack {
                                                Spacer()
                                                CourseCardView(course: course)
                                                    .frame(width: geo.size.width - 20, height: 200)
                                                    .cornerRadius(15)
                                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: 2, y: 5)
                                                Spacer()
                                            }
                                        }
                                        .frame(height:200)
                                    }.padding(.top,25)
                                } else if selectedQuarter == 3 {
                                    NavigationLink(destination: CourseDetailView(course: course)) {
                                        GeometryReader { geo in
                                            
                                            HStack {
                                                Spacer()
                                                CourseCardView(course: course)
                                                    .frame(width: geo.size.width - 20, height: 200)
                                                    .cornerRadius(15)
                                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: 2, y: 5)
                                                Spacer()
                                            }
                                        }
                                        .frame(height:200)
                                    }.padding(.top,25)
                                }
                            }
                        }
                    }.padding(.horizontal)
                        .padding(.top, 150)
                }
                
            }.navigationBarHidden(true)
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
            .environmentObject(UserModel())
            .previewDevice("iPhone 11")
    }
}
