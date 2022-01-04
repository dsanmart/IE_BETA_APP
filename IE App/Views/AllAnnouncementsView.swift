//
//  AllAnnouncementsView.swift
//  IE App
//
//  Created by Diego Sanmartin on 22/12/2021.
//

import SwiftUI

struct AllAnnouncementsView: View {
    // Reference the view model
    @EnvironmentObject var model:UserModel
    
    let getIndex = LoginAPIService()
    var userIndex: Int {
        get {
            return getIndex.index()
        }
    }
    var body: some View {
        let user = model.users[userIndex]
        NavigationView {
            List{
                ForEach(user.blackboardData.courses, id: \.id) { course in
                    ForEach(course.announcements, id: \.id) { announce in
                        NavigationLink(destination: DetailAnnouncementView(announcement: announce)) {
                            AnnouncementRow(announcement: announce)
                        }
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}

struct AllAnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        AllAnnouncementsView()
            .environmentObject(UserModel())
    }
}
