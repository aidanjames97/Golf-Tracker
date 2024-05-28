//
//  AddRound.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import SwiftUI

struct AddRound: View {
    @Environment(ModelData.self) var modelData
    var course: Course
    @State private var done = false
    
    @Binding var userShot: String
    @Binding var bPut: String
    @Binding var wPut: String
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: .distantFuture)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: .distantFuture)!
            return min...max
        }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .center) {
                CircleMap(course: course)
                    .frame(width: 250, height: 250)
                Text(course.name)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 10)
                HStack {
                    // each item gets vertical stack inside of the horizontal container
                    VStack {
                        Text("9 Par")
                            .bold()
                        Text(String(course.ninePar))
                    }
                    .padding(.trailing, 20)
                    
                    VStack {
                        Text("9 Dist")
                            .bold()
                        Text(String(course.nineDis))
                    }
                    .padding(.trailing, 20)
                    
                    VStack {
                        Text("18 Par")
                            .bold()
                        Text(String(course.ePar))
                    }
                    .padding(.trailing, 20)
                    
                    VStack {
                        Text("18 Dist.")
                            .bold()
                        Text(String(course.eDist)) // using calculated handicap
                    }
                    .padding(.trailing, 20)
                }
                .padding(.bottom, 10)
                Divider()
                    .overlay(.white)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 10)
                
                // user shot
                HStack {
                    Text("Shot:")
                    Spacer()
                    TextField("shot", text: $userShot)
                        .multilineTextAlignment(.trailing)
                        .autocorrectionDisabled()
                }
                .padding(.horizontal, 25)
                HStack {
                    Text("Best Put:")
                    TextField("best", text: $userShot)
                        .multilineTextAlignment(.trailing)
                        .autocorrectionDisabled()
                }
                .padding(.horizontal, 25)
                HStack {
                    Text("Worst Put:")
                    TextField("worst", text: $userShot)
                        .multilineTextAlignment(.trailing)
                        .autocorrectionDisabled()
                }
                .padding(.horizontal, 25)
                HStack {
                    Text("Holes Played:")
                    TextField("holes", text: $userShot)
                        .multilineTextAlignment(.trailing)
                        .autocorrectionDisabled()
                }
                .padding(.horizontal, 25)
                
                Spacer()
                
                Button {
                    done.toggle()
                } label: {
                    Label("Done", systemImage: "checkmark")
                }
                    .padding(10)
                    .foregroundStyle(.white)
                    .bold()
                    .background(.gradientTop)
                    .cornerRadius(25)
            }
            .padding()
        }
        .frame(height: .infinity)
        .foregroundStyle(.white)
        .background(Gradient(colors: gradientColors))
    }
}

struct CircleMap: View {
    var course: Course
    
    var body: some View {
        MapView(coordinate: course.locationCoordinates, zoom: 0.03)
            .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 50)
        }
}


#Preview {
    let modelData = ModelData()
    return AddRound(course: modelData.courses[0], userShot: .constant(""), bPut: .constant(""), wPut: .constant(""))
        .environment(ModelData())
}
