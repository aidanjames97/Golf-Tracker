//
//  RoundRow.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import SwiftUI

struct RoundRow: View {
    var round: Round
    
    var body: some View {
        HStack {
            MapView(coordinate: round.locationCoordinates, zoom: 0.02)
                .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                Text(round.name)
                    .font(.callout)
                    .bold()
                Text("\(round.date.month) \(round.date.day), \(round.date.year)")
                    .font(.caption)
            }
            .padding(.leading, 5)
            
            Spacer()
            
            if (round.handicap) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            } else {
                Image(systemName: "star")
                    .foregroundStyle(.gray)
            }
        }
        .background(Color.clear)
    }
}

#Preview {
    let round = ModelData().rounds
    return RoundRow(round: round[0])
}
