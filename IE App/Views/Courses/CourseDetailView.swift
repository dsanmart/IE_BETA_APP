//
//  CourseDetailView.swift
//  IE App
//
//  Created by Diego Sanmartin on 21/12/2021.
//

import SwiftUI

struct CourseDetailView: View {
    
    var course:Course
    
    var body: some View {
        VStack {
            Spacer()
            Text(course.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .padding()
                Image(systemName: "hammer.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .padding()
            }
            Text("Page is under construction")
            Spacer()
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = UserModel()
        let user = model.users[0]
        CourseDetailView(course: user.blackboardData.courses[0])
    }
}
