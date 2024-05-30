//
//  RoundList.swift
//  golf
//
//  Created by Aidan James on 2024-05-14.
//

import SwiftUI

struct RoundList: View {
    @Environment(ModelData.self) var modelData
    let rounds: [Round]
    @State private var selected: Round?
    
    let gradientColors: [Color] = [
        .gradientTop,
        .gradientBottom
    ]
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .fill(.clear)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    Text("Completed Rounds")
                        .font(.title)
                        .bold()
                    
                    ForEach(rounds) { round in
                        Button {
                            selected = round
                        } label: {
                            RoundRow(round: round)
                                .environment(ModelData())
                        }
                    }
                    .sheet(item: $selected, content: { r in
                        RoundDetail(round: r, profile: modelData.profile)
                            .environment(ModelData())
                            .presentationDetents([.fraction(0.999)])
                    })
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    RoundList(rounds: Round.sampleData)
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
        .environment(ModelData())
}
