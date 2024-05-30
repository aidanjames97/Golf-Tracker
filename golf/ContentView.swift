//
//  ContentView.swift
//  golf
//
//  Created by Aidan James on 2024-05-14.
//

import SwiftUI

// global
let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    @State private var selection: Tab = .round // holds current tab view view (default is round list)
    @Binding var rounds: [Round]
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void // saveAction property passed an empty action in preview
    
    enum Tab {
        case round
        case courses
        case profile
    }
    
    var body: some View {
        TabView {
            RoundList(rounds: rounds)
                .environment(ModelData())
                .tabItem {
                    Image(systemName: "star.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
                .tag(Tab.round)
            CourseList(rounds: $rounds)
                .environment(ModelData())
                .tabItem {
                    Image(systemName: "list.bullet.circle")
                        .aspectRatio(contentMode: .fill)
                }
                .tag(Tab.courses)
            ProfileHost()
                .environment(ModelData())
                .tabItem {
                    Image(systemName: "person.circle")
                }
                .tag(Tab.profile)
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundStyle(.white)
        // observes scenePhase value (trigger actions when a specified value changes)
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() } // if scene moving to inactive phase
            
        }
    }
}

#Preview {
    ContentView(rounds: .constant(Round.sampleData), saveAction: {})
}
