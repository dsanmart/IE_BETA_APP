//
//  AthleticsWebView.swift
//  IE App
//
//  Created by Diego Sanmartin on 10/01/2022.
//

import SwiftUI

struct AthleticsWebView: View {
    var body: some View {
        WebView(url: URL(string: "https://ieathleticreservations.ie.edu/sz")!)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct AthleticsWebView_Previews: PreviewProvider {
    static var previews: some View {
        AthleticsWebView()
    }
}
