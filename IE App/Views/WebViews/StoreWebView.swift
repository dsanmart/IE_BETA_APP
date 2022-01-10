//
//  ShopWebView.swift
//  IE App
//
//  Created by Diego Sanmartin on 10/01/2022.
//

import SwiftUI

struct StoreWebView: View {
    var body: some View {
        WebView(url: URL(string: "https://store.ie.edu/")!)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct StoreWebView_Previews: PreviewProvider {
    static var previews: some View {
        StoreWebView()
    }
}
