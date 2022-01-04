//
//  ByCourseAnnouncementsView.swift
//  IE App
//
//  Created by Diego Sanmartin on 22/12/2021.
//

import SwiftUI

struct ByCourseAnnouncementsView: View {
    
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
                ForEach(user.blackboardData.courses) { course in
                    Section(header: Text(course.title)){
                        ForEach(course.announcements, id: \.id) { announce in
                            NavigationLink(destination: DetailAnnouncementView(announcement: announce)) {
                                AnnouncementRow(announcement: announce)
                            }
                        }
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}

struct AnnouncementRow: View {
    let announcement: Announcement
    var body: some View {
        Text(announcement.title)
    }
}


struct ByCourseAnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        ByCourseAnnouncementsView()
            .environmentObject(UserModel())
    }
}
