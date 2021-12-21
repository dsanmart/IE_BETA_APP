//
//  ProfileView.swift
//  IE App
//
//  Created by Diego Sanmartin on 20/12/2021.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {

        GeometryReader { geo in
            VStack(alignment: .center) {
                ProfileCardView()
                    .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                    .cornerRadius(15)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
            }.frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .previewDevice("iPhone 13")
    }
}
