//
//  ProfileCardView.swift
//  IE App
//
//  Created by Diego Sanmartin on 21/12/2021.
//

import SwiftUI

struct ProfileCardView: View {
    
    var user:User
    
    var body: some View {
        
        // Profile card
        VStack(spacing: 0) {
            
            // ZStack to indicate health passport status
            ZStack {
            if user.covidTracerData.status == "green" {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(height: 220)
            } else {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(height: 220)
            }
            
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    ZStack(alignment: .center) {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 108, height: 108, alignment: .center)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 105, height: 108, alignment: .center)
                        Image(user.blackboardData.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                    
                    ZStack(alignment: .center) {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 43, height: 43)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 40, height: 40)
                        if user.covidTracerData.status == "green" {
                            Image("green_tick_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                        } else {
                            Image("red_cross_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                        }
                    }.alignmentGuide(.bottom, computeValue: {_ in 25})
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
                if user.covidTracerData.status == "green" {
                    Text("Acces to Campus is Allowed")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(2)
                } else {
                    Text("Acces to Campus Not Allowed")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(2)
                }
                Text(user.covidTracerData.reason)
                    .font(.body)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(2)
            }
        }
            
            // ZStack to contain profile info
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .foregroundColor(Color.white)
                ScrollView {
                    VStack(alignment: .leading) {
                    Text("Student ID:")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                        Text(user.blackboardData.id)
                        .font(.title)
                        .padding(.bottom, 20)
                    Text("Name and Surname:")
                        .font(.headline)
                        .fontWeight(.bold)
                        Text(user.blackboardData.name)
                        .font(.title)
                        .padding(.bottom, 20)
                    Text("Current date and time:")
                        .font(.headline)
                        .fontWeight(.bold)
                        Text(user.covidTracerData.dateAccessed + "     " + user.covidTracerData.timeAccessed)
                        .font(.title)
                        .padding(.bottom, 20)
                    Text("ID or Passport number:")
                        .font(.headline)
                        .fontWeight(.bold)
                        Text(user.covidTracerData.passport)
                        .font(.title)
                        .padding(.bottom, 20)
                    Text("Email address:")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(user.id)
                        .font(.largeTitle)
                        .minimumScaleFactor(0.01)
                        .lineLimit(1)
                        .foregroundColor(Color.black)
                        .padding(.bottom, 20)

                }.padding()
                }
            }
        
        }
    }
}

struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = UserModel()
        
        ProfileCardView(user: model.users[1])
            .previewDevice("iPhone 11")
    }
}
