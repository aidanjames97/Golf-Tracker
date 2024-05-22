//
//  RoundList.swift
//  golf
//
//  Created by Aidan James on 2024-05-14.
//

import SwiftUI

struct RoundList: View {
    @Environment(ModelData.self) var modelData
    @State private var showHanicapRounds = false
    
    var filteredRounds: [Round] {
        modelData.rounds.filter { round in
            (!showHanicapRounds) || round.handicap
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Completed Rounds")
                    .font(.title)
                    .bold()
                
                List {
                    Toggle(isOn: $showHanicapRounds) {
                        Text("Handicap Only")
                    }
                    ForEach(filteredRounds) { round in
                        NavigationLink {
                            RoundDetail(round: round, profile: modelData.profile)
                        } label: {
                            RoundRow(round: round)
                        }
                    }
                }
                .navigationBarHidden(true)
                .animation(.default, value: filteredRounds)
            }
        }
    }
}

#Preview {
    RoundList()
        .environment(ModelData())
}
