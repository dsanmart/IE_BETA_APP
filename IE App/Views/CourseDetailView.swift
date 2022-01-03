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
            Text(course.title)
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
