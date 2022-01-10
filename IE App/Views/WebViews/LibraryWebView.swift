//
//  LibraryWebView.swift
//  IE App
//
//  Created by Diego Sanmartin on 10/01/2022.
//

import SwiftUI

struct LibraryWebView: View {
    var body: some View {
        WebView(url: URL(string: "https://library.ie.edu/")!)
            .edgesIgnoringSafeArea(.bottom)
        //https:/library.ie.edu/resources/premium-press/
    }
}

struct LibraryWebView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryWebView()
    }
}
