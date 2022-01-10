//
//  CovidWebView.swift
//  IE App
//
//  Created by Diego Sanmartin on 10/01/2022.
//

import SwiftUI

struct CovidWebView: View {
    var body: some View {
        WebView(url: URL(string: "https://covid19-tracer.preversalud.es/sm")!)
            .edgesIgnoringSafeArea(.bottom)
    
    }
}

struct CovidWebView_Previews: PreviewProvider {
    static var previews: some View {
        CovidWebView()
    }
}
