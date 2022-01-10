//
//  BookingWebView.swift
//  IE App
//
//  Created by Diego Sanmartin on 10/01/2022.
//

import SwiftUI

struct BookingWebView: View {
    var body: some View {
        WebView(url: URL(string: "https://booking.ie.edu/#/bookings/")!)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct BookingWebView_Previews: PreviewProvider {
    static var previews: some View {
        BookingWebView()
    }
}
