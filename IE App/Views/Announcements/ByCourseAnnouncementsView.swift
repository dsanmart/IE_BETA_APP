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
    @State var sectionState: [Int: Bool] = [:]
    
    var body: some View {
        
        let user = model.users[userIndex]
        NavigationView {
            /*
            //Grouped List
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
            */
            //Grouped & Expandable List
            
            List{
                ForEach(user.blackboardData.courses) { course in
                    Section{
                        
                        DisclosureGroup{
                            ForEach(course.announcements, id: \.id) { announce in
                                NavigationLink(destination: DetailAnnouncementView(announcement: announce)) {
                                    AnnouncementRow(announcement: announce)
                                }
                            }
                        } label:{
                            HStack {
                                Image(systemName: "book")
                            Text(course.title)
                                .fontWeight(.semibold)
                            }
                        }
                    }
                }
            }.navigationBarHidden(true)
    
            
            //Grouped & Expandable List custom type
            /*
            List{
                ForEach(user.blackboardData.courses, id: \.id) { course in
                    Section(header: Text(course.title).onTapGesture {
                        self.sectionState[course] = !self.isExpanded(course)
                    }){
                        if self.isExpanded(course) {
                            ForEach(course.announcements, id: \.id) { announce in
                                NavigationLink(destination: DetailAnnouncementView(announcement: announce)) {
                                    AnnouncementRow(announcement: announce)
                                }
                            }
                        }
                    }
                }
            }.navigationBarHidden(true)
                .listStyle(SidebarListStyle())
             */
        }
    }
    func isExpanded(_ section: Int) -> Bool {
            sectionState[section] ?? false
        }
}

struct AnnouncementRow: View {
    let announcement: Announcement
    var body: some View {
        HStack {
            Image(systemName: "message")
            Text(announcement.title)
        }
    }
}


struct ByCourseAnnouncementsView_Previews: PreviewProvider {
    static var previews: some View {
        ByCourseAnnouncementsView()
            .environmentObject(UserModel())
    }
}
