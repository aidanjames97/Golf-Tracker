//
//  CourseView.swift
//  golf
//
//  Created by Aidan James on 2024-05-21.
//

import SwiftUI
import MapKit

struct CourseView: View {
    @Environment(ModelData.self) var modelData
    var course: Course
    
    // what is to be displayed onscreen
    var body: some View {
        NavigationView {
            // vertical stack container
            VStack {
                MapView(coordinate: course.locationCoordinates, zoom: 0.025)
                    .frame(height: 300) // size of map on screen
                // using TextOverlay struct (below) to display text on top of map
                    .overlay {
                        TextOverlayLoc(loc: course.loc)
                    }
                
                // display course website
                HStack {
                    VStack {
                        Divider()
                    }
                    Text("Visit Them:")
                        .frame(width: 200)
                        .bold()
                    VStack {
                        Divider()
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                Text("www.huronoaks.com/test")
                    .bold()
                    .font(.title3)
                
                HStack {
                    VStack {
                        Divider()
                    }
                    // course information
                    Text("Course Info:")
                        .frame(width: 200)
                        .bold()
                    VStack {
                        Divider()
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                // displays 9 hole information (always on)
                HStack {
                    // nine hole
                    VStack {
                        Text("9 Par:")
                        Text("36")
                            .bold()
                    }
                    .padding(.trailing, 15)
                    
                    VStack {
                        Text("9 Distance:")
                        Text("3850")
                            .bold()
                    }
                    .padding(.leading, 15)
                }
                .padding(.bottom, 10)
                
                // displays 18 hole information (only if course has 18 holes)
                if(course.ePar != 0) {
                    HStack {
                        // 18 holes
                        VStack {
                            Text("18 Par:")
                            Text("\(course.ePar)")
                                .bold()
                        }
                        .padding(.trailing, 15)
                        
                        VStack {
                            Text("18 Distance:")
                            Text("\(course.eDist)")
                                .bold()
                        }
                        .padding(.leading, 15)
                    }
                }
                HStack {
                    VStack {
                        Divider()
                    }
                    // course rating
                    Text("Rate the Course:")
                        .bold()
                        .frame(width: 250)
                    VStack {
                        Divider()
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                RatingView(rating: course.review)
                    .padding(.top, 5)
            }
            .font(.title2)
            Spacer()
        }
        .navigationTitle(Text("\(course.name)"))
        .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
    }
}

// TextOverlay struct to put text on top of pictures, maps, etc.
struct TextOverlayLoc: View {
    var loc: String // course location
    
    // adding gradient to bottom of pic, map, etc so that text can be more easily seen
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.4), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    // what is to be shown on screen
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                HStack {
                    Text(loc)
                        .font(.title2)
                        .bold()
                    
                    Spacer() // add spacing so star will be on right side
                }
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    let modelData = ModelData()
    return CourseView(course: modelData.courses[0])
        .environment(modelData)
}
