//
//  ContentView.swift
//  golf
//
//  Created by Aidan James on 2024-05-14.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .round
    
    enum Tab {
        case round
        case courses
    }
    
    var body: some View {
        TabView(selection: $selection) {
            RoundList()
                .tabItem {
                    Label("Rounds", systemImage: "star.circle")
                }
                .tag(Tab.round)
            CourseList()
                .tabItem {
                    Label("Courses", systemImage: "list.bullet.circle")
                }
            AddRound()
                .tabItem {
                    Label("Add Round", systemImage: "plus.circle")
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
