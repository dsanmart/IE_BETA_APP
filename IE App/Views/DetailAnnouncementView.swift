//
//  DetailAnnouncementView.swift
//  IE App
//
//  Created by Diego Sanmartin on 04/01/2022.
//

import SwiftUI

struct DetailAnnouncementView: View {
    
    var announcement: Announcement
    
    var body: some View {
        VStack {
            Text(announcement.title)
            Text(announcement.content)
        }.padding()
    }
}

struct DetailAnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        let model = UserModel()
        let user = model.users[0]
        let course = user.blackboardData.courses[0]
        DetailAnnouncementView(announcement: course.announcements[0])
    }
}
