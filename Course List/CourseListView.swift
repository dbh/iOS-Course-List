//
//  ContentView.swift
//  Course List
//
//  Created by Dovid Harrison on 10/27/22.
//

import SwiftUI

struct CourseListView: View {
    
    @State var courses: [Course] = []
    
    var body: some View {
        
        if courses.count==0 {
            VStack {
                ProgressView()
                    .padding()
                Text("Retrieving Courses")
                    .foregroundColor(.purple)
                    .onAppear(perform: {
                        getCourses()
                    })
            }
        } else {
            ScrollView {
                VStack {
                    Text("\(courses.count)")
                    ForEach(courses) {  listedCourse in
                        
                        CourseTileView(course: listedCourse)
                    }
                    .padding()
                }
            }
        }
    }
    
    func getCourses() {
        let courseUrl = "https://zappycode.com/api/courses?format=json"
        if let apiURL = URL(string: courseUrl) {
            var request = URLRequest(url:apiURL)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    print("There was an error")
                } else if data != nil {
                    //                    print(String(data: data!, encoding: .utf8) ?? "Error")
                    //
                    if let coursesFromAPI = try?JSONDecoder().decode([Course].self, from: data!) {
                        
                        print(coursesFromAPI.count)
                        courses = coursesFromAPI
                    }
                }
                
                
            }
            .resume()
            
        }
        
    }
}

struct Course: Identifiable, Codable {
    var id: Int
    var title: String
    var subtitle: String
    var image: String
}

//struct TempImage_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            Image(systemName: "books.vertical")
//                .font(.largeTitle)
//                .padding(80)
//        }
//        .frame(maxWidth: .infinity)
//        .background(Color.gray)
//
//
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        let courses: [Course] = [Course(id: 123, title:"Example Course", subtitle:"Learning how to do it", image: "https://zappycode.com/media/course_images/MasteringDjangoPart1CourseImage.png")]
        //        CourseListView(courses: courses)
        CourseListView()
    }
}
