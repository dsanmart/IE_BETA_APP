//
//  LoginView.swift
//  IE App
//
//  Created by Diego Sanmartin on 29/12/2021.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    @State var rememberMe = false
    
    var body: some View {
        if loginVM.showProgressView {
            LaunchScreenView()
        } else {
        ZStack {
            GeometryReader { geo in
                // MARK: Dot with title
                Ellipse()
                    .fill(SwiftUI.Color("LightBlue"))
                    .frame(width: geo.size.width*2, height: geo.size.width*2, alignment: .center)
                    .ignoresSafeArea()
                    .position(x: geo.size.width/2, y: 120-geo.size.width)
                
                Text("Log In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .position(x: geo.size.width/2)
                    .padding(.top, 50)
            }
            VStack (spacing: 20) {
                Text("Log in to your existing account")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
                
                HStack {
                    Image(systemName: "person").foregroundColor(.gray).padding(.leading, 10)
                        .padding(.vertical, 15)
                TextField("Email Address", text: $loginVM.credentials.email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(.plain)
                    
                }.background(.white)
                
                HStack {
                    Image(systemName: "lock").foregroundColor(.gray).padding(.leading, 10)
                        .padding(.vertical, 15)
                    SecureField("Password", text: $loginVM.credentials.password).padding(.vertical, 7)
                        .textFieldStyle(.plain)
                }
                .background(.white)
                
                
                
                
                Button("LOG IN") {
                    LocalStorage.user = loginVM.credentials.email
                    loginVM.login { success in
                        authentication.updateValidation(success: success)
                    }
                }
                .padding(.vertical)
                .disabled(loginVM.loginDisabled)
                .buttonStyle(LogInButtonStyle())
                
                Toggle(isOn: $rememberMe) {
                    Text("Remember Me")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(Color.white)
                        .font(Font.title2.weight(.semibold))
                }.toggleStyle(SwitchToggleStyle(tint: .blue))
                    
                
                Spacer()
                
                Image("ie_horizontal_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
                
            }.padding(.top, 200)
                .padding(.horizontal, 30)
            .autocapitalization(.none)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .disabled(loginVM.showProgressView)
            .alert(item: $loginVM.error) { error in
                Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
            }
        }.background(SwiftUI.Color("DarkBlue"))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
