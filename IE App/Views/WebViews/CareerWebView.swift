//
//  CareerWebView.swift
//  IE App
//
//  Created by Diego Sanmartin on 10/01/2022.
//

import SwiftUI

struct CareerWebView: View {
    var body: some View {
        WebView(url: URL(string: "https://ie-csm.symplicity.com")!)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct CareerWebView_Previews: PreviewProvider {
    static var previews: some View {
        CareerWebView()
    }
}
