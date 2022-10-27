//
//  CourseTileView.swift
//  iOS Course List
//
//  Created by Dovid Harrison on 10/27/22.
//

import SwiftUI

struct CourseTileView: View {
    var course: Course
    
    var body: some View {
        AsyncImage(url: URL(string: course.image)) { phase in
            
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                
            default:
                VStack {
                    Image(systemName: "books.vertical")
                        .font(.largeTitle)
                        .padding(80)
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray)
            }
            
        }
    }
}

struct CourseTileView_Previews: PreviewProvider {
    static var previews: some View {
        CourseTileView(course: Course(id: 5, title: "Hello", subtitle: "World!", image: "https://avatars.githubusercontent.com/u/664513?s=96&v=4"))
    }
}
