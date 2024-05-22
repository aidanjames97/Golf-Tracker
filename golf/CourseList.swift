//
//  CourseList.swift
//  golf
//
//  Created by Aidan James on 2024-05-21.
//

import SwiftUI

struct CourseList: View {
    @Environment(ModelData.self) var modelData
    @State private var searchText: String = ""

        var filteredCourses: [Course] {
            if searchText.isEmpty {
                return modelData.courses
            } else {
                return modelData.courses.filter { c in
                    c.name.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Find a Course")
                    .font(.title)
                    .bold()
                
                // Search Bar
                TextField("Search...", text: $searchText)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                    .overlay(
                        HStack {
                            Spacer()
                            if !searchText.isEmpty {
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .padding(.trailing, 15)
                                }
                            }
                        }
                    )
                
                // Filtered List
                List{
                    ForEach(filteredCourses) { c in
                        NavigationLink {
                            CourseView(course: c)
                                .frame(width: .infinity, height: .infinity)
                        } label: {
                            Text("\(c.name) - \(c.loc)")
                                .foregroundStyle(.black)
                        }
                    }
                }
                .navigationBarHidden(true)
                .animation(.default, value: filteredCourses)
            }
        }
    }
}

#Preview {
    CourseList()
        .environment(ModelData())
}
