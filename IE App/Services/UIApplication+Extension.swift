//
//  UIApplication+Extension.swift
//  IE App
//
//  Created by Diego Sanmartin on 29/12/2021.
//

import UIKit

extension UIApplication {
    
    // Function to close keyboard when tapped outside of it in loginView
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
