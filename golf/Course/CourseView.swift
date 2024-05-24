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
    @State private var addRound = false
    
    // what is to be displayed onscreen
    var body: some View {
        // vertical stack container
        VStack {
            MapView(coordinate: course.locationCoordinates, zoom: 0.025)
            // using TextOverlay struct (below) to display text on top of map
                .overlay {
                    TextOverlayLoc(loc: course.loc, name: course.name)
                }
            
            // display course website
            HStack {
                VStack {
                    Divider()
                        .overlay(.white)
                }
                Text("Visit Them:")
                    .frame(width: 145)
                    .bold()
                VStack {
                    Divider()
                        .overlay(.white)
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
                        .overlay(.white)
                }
                // course information
                Text("Course Info:")
                    .frame(width: 150)
                    .bold()
                VStack {
                    Divider()
                        .overlay(.white)
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
                        .overlay(.white)
                }
                // course rating
                Text("Rate the Course:")
                    .bold()
                    .frame(width: 180)
                VStack {
                    Divider()
                        .overlay(.white)
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            RatingView(rating: course.review)
                .padding(.top, 5)
                .padding(.bottom, 10)
            
            Button {
                addRound.toggle()
            } label: {
                Label("Add Round", systemImage: "plus")
            }
            .sheet(isPresented: $addRound) {
                AddRound(course: course, userShot: .constant("66"))
                    .presentationDetents([.fraction(0.999)])
            }
                .padding(10)
                .foregroundStyle(.white)
                .bold()
                .background(.gradientTop)
                .cornerRadius(25)
            }
            .font(.title2)
            .foregroundStyle(.white)
            .background(Gradient(colors: gradientColors))
    }
}

// TextOverlay struct to put text on top of pictures, maps, etc.
struct TextOverlayLoc: View {
    var loc: String // course location
    var name: String
    
    // adding gradient to bottom of pic, map, etc so that text can be more easily seen
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.4), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    // adding gradient to bottom of pic, map, etc so that text can be more easily seen
    var gradientTop: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.2), .black.opacity(0)]),
            startPoint: .top,
            endPoint: .center)
    }
    
    // what is to be shown on screen
    var body: some View {
        ZStack(alignment: .top) {
            gradientTop
            VStack(alignment: .center) {
                Text(name)
                    .font(.title)
                    .bold()
            }
            .padding()
        }
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                HStack {
                    Text(loc)
                        .font(.title2)
                        .bold()
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
        .frame(maxHeight: .infinity)
        .environment(ModelData())
}
