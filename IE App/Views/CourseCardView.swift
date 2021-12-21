//
//  CourseCardView.swift
//  IE App
//
//  Created by Diego Sanmartin on 21/12/2021.
//

import SwiftUI

struct CourseCardView: View {
    var body: some View {
        
        // Course card view
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            GeometryReader { geo in
            VStack(spacing: 0) {

                Image("calculus_background")
                    .centerCropped()
                    .frame(height:125)
                    .clipped()
                
                Text("Calculus for Computer Science")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top,20)
                    .padding(.horizontal, 10)
                    .foregroundColor(.black)
                    .textCase(.uppercase)
                    .minimumScaleFactor(0.75)
                    .lineLimit(1)

                Text("Miguel Vaquero")
                    .font(.headline)
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
        CourseCardView()
    }
}
