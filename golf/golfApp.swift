//
//  golfApp.swift
//  golf
//
//  Created by Aidan James on 2024-05-14.
//

import SwiftUI

@main
struct golfApp: App {
    @StateObject private var store = RoundStore() // loading data on app open (root view)
    // creates a single instance of an observable object
    
    var body: some Scene {
        WindowGroup {
            ContentView(rounds: $store.rounds) {
                Task {
                    do {
                        try await store.save(rounds: store.rounds)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            // task modifier (allows async. func calls)
                .task {
                    // loads saved round data or halts for errors
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
                .environment(ModelData())
        }
    }
}
