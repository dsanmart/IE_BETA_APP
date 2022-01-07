//
//  CalendarHome.swift
//  IE App
//
//  Created by rayane mazari on 28/12/21.
//

import SwiftUI

struct CalendarHome: View {
    @State var currentDate: Date = Date()
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20){
                // custom date picker...
                CalendarUser(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        //Safe Area View...
        .safeAreaInset(edge: .bottom){
            HStack{
                Button{
                    
                }label:{
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(SwiftUI.Color("LightBlue"), in: Capsule())
                }
                
                Button{
                    
                }label:{
                    Text("Add Reminder").fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(SwiftUI.Color("DarkBlue"), in: Capsule())
                }
            }
            .padding(.horizontal)
            .padding(.top,10)
            .padding(.bottom,10)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
    }
}

struct CalendarHome_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHome()
    }
}
