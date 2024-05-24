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
    @State private var selection: Tab = .round
    
    enum Tab {
        case round
        case courses
        case profile
    }
    
    var body: some View {
        TabView {
            RoundList()
                .tabItem {
                    Image(systemName: "star.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                }
                .tag(Tab.round)
            CourseList()
                .tabItem {
                    Image(systemName: "list.bullet.circle")
                        .aspectRatio(contentMode: .fill)
                }
                .tag(Tab.courses)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                }
                .tag(Tab.profile)
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
