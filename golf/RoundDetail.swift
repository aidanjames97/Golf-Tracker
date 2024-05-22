//
//  RoundDetail.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import SwiftUI
import MapKit

struct RoundDetail: View {
    @Environment(ModelData.self) var modelData
    var round: Round
    var profile: Profile
    
    // handicap calculation
    var handicap: Int {
        round.shot - round.par
    }
    
    // what is to be displayed onscreen
    var body: some View {
        NavigationView {
            // vertical stack container
            VStack {
                MapView(coordinate: round.locationCoordinates, zoom: 0.025)
                    .frame(height: 300) // size of map on screen
                // using TextOverlay struct (below) to display text on top of map
                    .overlay {
                        TextOverlay(name: round.name, loc: round.loc, handicap: round.handicap)
                    }
                    .padding(.top, -225)
                
                // horizontal stack container
                HStack {
                    // each item gets vertical stack inside of the horizontal container
                    VStack {
                        Text("Par")
                            .bold()
                        Text(String(round.par))
                    }
                    .padding(.trailing, 20)
                    
                    VStack {
                        Text("Shot")
                            .bold()
                        Text(String(round.shot))
                    }
                    .padding(.trailing, 20)
                    
                    VStack {
                        Text("Handicap")
                            .bold()
                        Text(String(handicap)) // using calculated handicap
                    }
                    .padding(.trailing, 20)
                }
                
                // divides next section
                Divider()
                // putting section of display
                Text("Putting")
                    .font(.title3)
                    .bold()
                
                // horizontal stack container
                HStack {
                    // each item gets vertical stack inside of the horizontal container
                    VStack {
                        Text("Avg")
                            .bold()
                        Text(String(round.par))
                    }
                    .padding(.trailing, 20)
                    
                    VStack {
                        Text("Best")
                            .bold()
                        Text(String(round.shot))
                    }
                    .padding(.trailing, 20)
                    
                    VStack {
                        Text("Total")
                            .bold()
                        Text(String(handicap)) // using calculated handicap
                    }
                    .padding(.trailing, 20)
                }
            }
            Spacer()
        }
        .navigationTitle("\(profile.username)'s Round")
        .navigationBarHidden(false)
    }
}

// TextOverlay struct to put text on top of pictures, maps, etc.
struct TextOverlay: View {
    var name: String // course name
    var loc: String // course location
    var handicap: Bool
    
    // adding gradient to bottom of pic, map, etc so that text can be more easily seen
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    // what is to be shown on screen
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                    .bold()
                HStack {
                    Text(loc)
                    
                    Spacer()
                    
                    if (handicap) {
                        Image(systemName: "star.fill")
                    } else {
                        Image(systemName: "star")
                            .foregroundStyle(.gray)
                    }
                        
                }
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    let modelData = ModelData()
    return RoundDetail(round: modelData.rounds[0], profile: modelData.profile)
            .environment(modelData)
}
