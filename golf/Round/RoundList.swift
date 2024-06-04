//
//  RoundList.swift
//  golf
//
//  Created by Aidan James on 2024-05-14.
//

import SwiftUI

struct RoundList: View {
    @State private var selected: Round?
    @Binding var rounds: [Round]
    
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
                    HStack {
                        Spacer()
                        Text("Completed Rounds")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                    ForEach(rounds) { round in
                        Button {
                            selected = round
                        } label: {
                            RoundRow(round: round)
                                .environment(ModelData())
                        }
                    }
                    .sheet(item: $selected, content: { r in
                        RoundDetail(rounds: $rounds, round: r)
                            .environment(ModelData())
                            .presentationDetents([.fraction(0.999)])
                    })
                    .padding(.bottom, 1)
                    
                    VStack {
                        Image(systemName: "figure.golf")
                            .font(.title)
                            .bold()
                            .padding(.bottom, 5)
                        Text("Swipe to add new round!")
                            .font(.title3)
                            .bold()
                    }
                    .padding(.top, 50)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}
