//
//  ProfileView.swift
//  IE App
//
//  Created by Diego Sanmartin on 20/12/2021.
//

import SwiftUI

struct ProfileView: View {
    
    // Reference the view model
    @EnvironmentObject var model:UserModel
    
    var body: some View {

        GeometryReader { geo in
            VStack(alignment: .center) {
                ProfileCardView(user: model.users[0])
                    .frame(width: geo.size.width - 40, height: geo.size.height - 40)
                    .cornerRadius(15)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
            }.frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                .padding(.top,10)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserModel())
            .previewDevice("iPhone 13")
    }
}
