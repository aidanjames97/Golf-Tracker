//
//  RoundList.swift
//  golf
//
//  Created by Aidan James on 2024-05-14.
//

import SwiftUI

struct RoundList: View {
    @Environment(ModelData.self) var modelData
    @State private var roundShow = false
    
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
                    
                    ForEach(modelData.rounds) { round in
                        Button {
                            roundShow.toggle()
                        } label: {
                            RoundRow(round: round)
                        }
                        .sheet(isPresented: $roundShow) {
                            RoundDetail(round: round, profile: modelData.profile)
                                .presentationDetents([.fraction(0.999)])
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
    }
}

#Preview {
    RoundList()
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
        .environment(ModelData())
}
