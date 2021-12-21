//
//  CoursesView.swift
//  IE App
//
//  Created by Diego Sanmartin on 20/12/2021.
//

import SwiftUI

struct CoursesView: View {
    
    @State var selectedQuarter = 3
    
    var body: some View {
        NavigationView {
            VStack {
                
                // MARK: Dot with title
                ZStack {
                    GeometryReader { geo in
                        Ellipse()
                            .fill(Color.blue)
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
                            ForEach(0..<6) { item in

                                NavigationLink(destination: CourseDetailView()) {
                                    GeometryReader { geo in
                                        
                                        HStack {
                                            Spacer()
                                            CourseCardView()
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
            .previewDevice("iPhone 13 Pro Max")
    }
}
