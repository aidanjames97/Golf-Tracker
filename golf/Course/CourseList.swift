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
    @State private var selected: Course?
    
    let gradientColors: [Color] = [
        .gradientTop,
        .gradientBottom
    ]

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
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(.clear)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Find a Course")
                    .font(.title)
                    .bold()
                
                // Search Bar
                TextField("Search...", text: $searchText)
                    .padding(7)
                    .padding(.horizontal, 5)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Spacer()
                            if !searchText.isEmpty {
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .padding(.trailing, 15)
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    )
                
                // Filtered List
                ForEach(filteredCourses) { c in
                    Button {
                        selected = c
                    } label: {
                        CourseRow(s: "\(c.name) - \(c.loc)")
                            .environment(ModelData())
                    }
                }
                .sheet(item: $selected, content: { c in
                    CourseView(course: c)
                        .environment(ModelData())
                        .presentationDetents([.fraction(0.999)])
                })
            }
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    CourseList()
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
        .environment(ModelData())
}
