//
//  Data.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import Foundation

@Observable
class ModelData {
    var profile: Profile = Profile.default
    var courses: [Course] = load("courseData.json")
}

// load fetches JSON data with given name from main bundle
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
