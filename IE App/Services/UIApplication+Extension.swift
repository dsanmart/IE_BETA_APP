//
//  UIApplication+Extension.swift
//  IE App
//
//  Created by Diego Sanmartin on 29/12/2021.
//

import UIKit
import SwiftUI

extension UIApplication {
    
    // Function to close keyboard when tapped outside of it in loginView
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct LogInButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    LogInButtonStyleView(configuration: configuration)
  }
}

extension Color {
  static let defaultBlue = Color(red: 0, green: 97 / 255.0, blue: 205 / 255.0)
  static let paleBlue = Color(red: 188 / 255.0, green: 224 / 255.0, blue: 253 / 255.0)
  static let paleWhite = Color(white: 1, opacity: 179 / 255.0)
}

private extension LogInButtonStyle {
  struct LogInButtonStyleView: View {
    // tracks if the button is enabled or not
    @Environment(\.isEnabled) var isEnabled
    // tracks the pressed state
    let configuration: LogInButtonStyle.Configuration

    var body: some View {
      return configuration.label
        // change the text color based on if it's disabled
            .font(Font.title2.weight(.bold))
            
        .foregroundColor(isEnabled ? .white : .paleWhite)
        .padding(.horizontal, 100)
        .padding(.vertical)
        .background(RoundedRectangle(cornerRadius: 30)
          // change the background color based on if it's disabled
          .fill(isEnabled ? SwiftUI.Color("LightBlue") : Color.paleBlue)
        )
        // make the button a bit more translucent when pressed
        .opacity(configuration.isPressed ? 0.8 : 1.0)
        // make the button a bit smaller when pressed
        .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
  }
}
