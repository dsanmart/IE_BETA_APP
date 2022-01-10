//
//  PerksWebView.swift
//  IE App
//
//  Created by Diego Sanmartin on 10/01/2022.
//

import SwiftUI

struct PerksWebView: View {
    var body: some View {
        WebView(url: URL(string: "https://benefits.ie.edu/offers/welcome")!)
            .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct PerksWebView_Previews: PreviewProvider {
    static var previews: some View {
        PerksWebView()
    }
}
