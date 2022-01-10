//
//  UndoneView.swift
//  IE App
//
//  Created by Diego Sanmartin on 10/01/2022.
//

import SwiftUI

struct UndoneView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .padding()
                Image(systemName: "hammer.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .padding()
            }
            Text("This page is under construction")
        }
    }
}

struct UndoneView_Previews: PreviewProvider {
    static var previews: some View {
        UndoneView()
    }
}
