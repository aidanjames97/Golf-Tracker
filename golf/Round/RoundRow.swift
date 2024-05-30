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
                .frame(width: 70, height: 70)
                .padding(5)
                .cornerRadius(25)
            
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
                    .padding(.trailing, 5)
            } else {
                Image(systemName: "star")
                    .foregroundStyle(.white)
                    .padding(.trailing, 5)
            }
        }
        .background(
            RoundedRectangle (cornerRadius: 10)
                .foregroundStyle(.white)
                .opacity(0.25)
                .brightness(-0.4)
        )
        .foregroundStyle(.white)
    }
}

#Preview {
    RoundRow(round: Round.sampleData[0])
}
