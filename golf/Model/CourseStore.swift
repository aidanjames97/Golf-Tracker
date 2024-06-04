//
//  CourseStore.swift
//  golf
//
//  Created by Aidan James on 2024-06-04.
//

import Foundation

@MainActor
class CourseStore: ObservableObject {
    @Published var course: [Course] = []
    
    // function returning url
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                            in: .userDomainMask,
                                            appropriateFor: nil,
                                            create: false)
        .appendingPathComponent("courses.data")
        
    }
    
    // async function
    func load() async throws {
        // store task in a let so that we can access values returned or catch errors from task
        let task = Task<[Course], Error> { // generic param
            let fileURL = try Self.fileURL() // local constant for file URL return
            
            // guard allows us to optionally load file data
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            // decode data into local constant
            let roundsPlayed = try JSONDecoder().decode([Course].self, from: data)
            return roundsPlayed // returning decoded array of scrums (avail. when task completes)
        }
        let course = try await task.value // waits for task to finish then assign value
        self.course = course // assigning scrums to scrums property
    }
    
    // method for saving round data to file system
    // may fail, so include throws for errors
    func save(course: [Course]) async throws {
        let task = Task { // create task
            let data = try JSONEncoder().encode(course) // encoding rounds data
            let outfile = try Self.fileURL() // constant for file URL
            try data.write(to: outfile) // encode data to file
        }
        _ = try await task.value // waiting for task to complete (we dont care about return value so _)
    }
}
