//
//  CalendarView.swift
//  IE App
//
//  Created by Diego Sanmartin on 20/12/2021.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedView = 0
    var body: some View {
        ZStack(alignment: .center) {
            GeometryReader { geo in
                // MARK: Dot with title
                Ellipse()
                    .fill(Color.blue)
                    .frame(width: geo.size.width*2, height: geo.size.width*2, alignment: .center)
                    .ignoresSafeArea()
                    .position(x: geo.size.width/2, y: 80-geo.size.width)
                
                Text("Calendar")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .position(x: geo.size.width/2)
                    .padding(.top, 30)
                
            
                // MARK: Quarter Picker
                Picker("", selection: $selectedView) {
                    Text("Schedule").tag(0)
                    Text("Due Dates").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width:geo.size.width-60)
                .position(x: geo.size.width/2,y: 120)
            }
            
            if selectedView == 0 {
                CalendarHome()
                    .padding(.top,140) // Change main ZStack alignment to .top in order to place the view correctly
            } else if selectedView == 1 {
                UndoneView()
                    .padding(.top,160)
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
