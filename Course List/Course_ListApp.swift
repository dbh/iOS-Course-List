//
//  Course_ListApp.swift
//  Course List
//
//  Created by Dovid Harrison on 10/27/22.
//

import SwiftUI

@main
struct Course_ListApp: App {
    var body: some Scene {
        WindowGroup {
//            let courses: [Course] = [Course(id: 123, title:"Example Course", subtitle:"Learning how to do it", image: "https://zappycode.com/media/course_images/MasteringDjangoPart1CourseImage.png")]
//            CourseListView(courses: courses)
            CourseListView()
        }
    }
}
