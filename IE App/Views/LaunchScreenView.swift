//
//  LaunchScreenView.swift
//  IE App
//
//  Created by Diego Sanmartin on 10/01/2022.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack{
            Rectangle().fill(SwiftUI.Color("DarkBlue"))
            Image("appstore")
                .resizable()
                .scaledToFit()
                .frame(width: 170, height: 170)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                .scaleEffect(1.5)
                .padding(.top, 450)
            /*VStack {
                Spacer()
                ProgressView("Signing In")
                    .foregroundColor(.white)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    .padding(.bottom, 50)
            }*/
        }.ignoresSafeArea()
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
