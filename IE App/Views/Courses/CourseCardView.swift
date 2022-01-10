//
//  CourseCardView.swift
//  IE App
//
//  Created by Diego Sanmartin on 21/12/2021.
//

import SwiftUI

struct CourseCardView: View {
    
    var course:Course

    var body: some View {
        
        // Course card view
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            GeometryReader { geo in
            VStack(spacing: 0) {

                Image(course.image)
                    .centerCropped()
                    .frame(height:125)
                    .clipped()
                
                Text(course.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top,20)
                    .padding(.horizontal, 10)
                    .foregroundColor(.black)
                    .textCase(.uppercase)
                    .minimumScaleFactor(0.75)
                    .lineLimit(1)

                Text(course.instructor)
                    .font(.callout)
                    .fontWeight(.regular)
                    .padding(.top, 5)
                    .padding(.bottom, 10)
                    .foregroundColor(Color.gray)
                    .textCase(.uppercase)
                }
            }
        }
    }
}

extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
            .resizable()
            .scaledToFill()
            .frame(width: geo.size.width, height: 125)
            .clipped()
        }
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = UserModel()
        let user = model.users[0]
        CourseCardView(course: user.blackboardData.courses[0])
    }
}
