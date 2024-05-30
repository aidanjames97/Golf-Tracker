//
//  RoundStore.swift
//  golf
//
//  Created by Aidan James on 2024-05-30.
//

// This will manage round data for the app

import Foundation

// must be marked MainActor before safe to publish rounds property from async. load method
@MainActor
// observable object is class-constrained protocol for connecting external model data to UI views
class RoundStore: ObservableObject {
    // array of round structures
    // published allows us to bind to the value
    @Published var rounds: [Round] = []
    
    // function returning url
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                            in: .userDomainMask,
                                            appropriateFor: nil,
                                            create: false)
        .appendingPathComponent("rounds.data")
        
    }
    
    // async function
    func load() async throws {
        // store task in a let so that we can access values returned or catch errors from task
        let task = Task<[Round], Error> { // generic param
            let fileURL = try Self.fileURL() // local constant for file URL return
            
            // guarl allows us to optionally load file data
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            // decode data into local constant
            let roundsPlayed = try JSONDecoder().decode([Round].self, from: data)
            return roundsPlayed // returning decoded array of scrums (avail. when task completes)
        }
        let rounds = try await task.value // waits for task to finish then assign value
        self.rounds = rounds // assigning scrums to scrums property
    }
    
    // method for saving round data to file system
    // may fail, so include throws for errors
    func save(rounds: [Round]) async throws {
        let task = Task { // create task
            let data = try JSONEncoder().encode(rounds) // encoding rounds data
            let outfile = try Self.fileURL() // constant for file URL
            try data.write(to: outfile) // encode data to file
        }
        _ = try await task.value // waiting for task to complete (we dont care about return value so _)
    }
    
}
