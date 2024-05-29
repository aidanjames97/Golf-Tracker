//
//  AddRound.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import SwiftUI
import Foundation

struct AddRound: View {
    @Environment(ModelData.self) var modelData
    var course: Course
    @State private var done = false
    
    @State private var userShot = "" // to be int
    @State private var tPut = "" // to be int
    @State private var bPut = "" // to be int
    @State private var wPut = "" // to be int
    @State private var holesPlayed = "" // to be int
    @State private var date = Date()
    
    @State private var showAlert = false
    
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
                    TextField("Shots", text: $userShot)
                        .multilineTextAlignment(.trailing)
                        .autocorrectionDisabled()
                }
                .padding(.horizontal, 25)
                HStack {
                    Text("Total Putts:")
                    TextField("Total", text: $tPut)
                        .multilineTextAlignment(.trailing)
                        .autocorrectionDisabled()
                }
                .padding(.horizontal, 25)
                HStack {
                    Text("Best Put:")
                    TextField("Best", text: $bPut)
                        .multilineTextAlignment(.trailing)
                        .autocorrectionDisabled()
                }
                .padding(.horizontal, 25)
                HStack {
                    Text("Worst Put:")
                    TextField("Worst", text: $wPut)
                        .multilineTextAlignment(.trailing)
                        .autocorrectionDisabled()
                }
                .padding(.horizontal, 25)
                HStack {
                    Text("Holes Played:")
                    TextField("Holes", text: $holesPlayed)
                        .multilineTextAlignment(.trailing)
                        .autocorrectionDisabled()
                }
                .padding(.horizontal, 25)
                
                Spacer()
                
                // Done button section, checking for correct inputs
                @State var idVal = modelData.rounds[(modelData.rounds.count)-1].id  + 1 // getting last id and adding one
                    
                Button("Done", systemImage: "checkmark", action : {
                    // checking shot input
                    if userShot.isEmpty || !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: userShot)) {
                        showAlert = true
                    }
                    // checking total puts input
                    if tPut.isEmpty || !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: tPut)) {
                        showAlert = true
                    }
                    // checking best put input
                    if bPut.isEmpty || !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: bPut)) {
                        showAlert = true
                    }
                    // checking worst put input
                    if wPut.isEmpty || !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: wPut)) {
                        showAlert = true
                    }
                    // checking holes played input
                    if holesPlayed.isEmpty || !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: holesPlayed)) {
                        showAlert = true
                    }
                    
                    // at this point all inputs are considered valid for entry
                    
                    done.toggle()
                })
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
        .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Invalid Input"),
                    message: Text("Make sure there are no letters or missing inputs")
                )
            }
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
    return AddRound(course: modelData.courses[0])
        .environment(ModelData())
}
