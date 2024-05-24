//
//  RoundDetail.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import SwiftUI
import MapKit

struct RoundDetail: View {
    var round: Round
    var profile: Profile
    
    // what is to be displayed onscreen
    var body: some View {
        // vertical stack container
        VStack {
            MapView(coordinate: round.locationCoordinates, zoom: 0.02)
            // using TextOverlay struct (below) to display text on top of map
                .overlay {
                    TextOverlay(name: round.name, loc: round.loc, handicap: round.handicap)
                }
                .padding(.bottom, 5)
            
            Text("Overall")
                .font(.title2)
                .bold()
                .padding(.bottom, 2)
            
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
                    Text("-1") // using calculated handicap
                }
            }
            
            // divides next section
            Divider()
                .overlay(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            
            // putting section of display
            Text("Putting")
                .font(.title2)
                .bold()
                .padding(.bottom, 2)
            
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
                    Text("33")
                }
            }
            // divides next section
            Divider()
                .overlay(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
            
            VStack {
                Text("Played: \(round.date.month) \(round.date.day), \(round.date.year)")
                    .font(.title2)
                    .bold()
            }
        }
        .foregroundStyle(.white)
        .background(Gradient(colors: gradientColors))
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
    return RoundDetail(round: modelData.rounds[4], profile: modelData.profile)
        .frame(maxHeight: .infinity)
}
