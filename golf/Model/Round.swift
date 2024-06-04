//
//  Round.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import Foundation
import CoreLocation
import SwiftUI

struct Round: Hashable, Codable, Identifiable {
    var id: UUID // unique round id
    var shot: String // users shots scored
    
    // course coordinates for maps
    private var coordinates: Coordinates
        var locationCoordinates: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }
    
        struct Coordinates: Hashable, Codable {
            var latitude: Double
            var longitude: Double
        }
    
    var name: String // name of course
    var loc: String // course location
    var par: Int // course par
    var handicap: Bool // does round impact handicap
    
    var date: Date
    struct Date: Hashable, Codable {
        var day: Int
        var month: String
        var year: String
    }
    var Tputs: Int // total puts
    var Bputs: Int // best put
    var Wputs: Int // worst puts
    var holePlayed: Int // holes user played
    
    // to init new round
    init(id: UUID = UUID(), shot: String, latitude: Double, longitude: Double, name: String, loc: String, par: Int, handicap: Bool, date: Date, Tputs: Int, Bputs: Int, Wputs: Int, holePlayed: Int) {
        self.id = id
        self.shot = shot
        self.coordinates = Coordinates(latitude: latitude, longitude: longitude)
        self.name = name
        self.loc = loc
        self.par = par
        self.handicap = handicap
        self.date = date
        self.Tputs = Tputs
        self.Bputs = Bputs
        self.Wputs = Wputs
        self.holePlayed = holePlayed
    }
}

extension Round {
    static let sampleData: [Round] = [
        Round(shot: "77", latitude: 42.960966442983384, longitude: -82.29152739171403, name: "Greystone GC", loc: "Sarnia, ON", par: 36, handicap: false, date: .init(day: 11, month: "August", year: "2024"), Tputs: 12, Bputs: 1, Wputs: 2, holePlayed: 9),
        Round(shot: "70", latitude: 43.02397805770129, longitude: -82.26429332824019, name: "Huron Oaks", loc: "Brights Grove, ON", par: 72, handicap: true, date: .init(day: 11, month: "May", year: "2024"), Tputs: 30, Bputs: 1, Wputs: 3, holePlayed: 18),
        Round(shot: "82", latitude: 43.02397805770129, longitude: -82.26429332824019, name: "Huron Oaks", loc: "Brights Grove, ON", par: 72, handicap: true, date: .init(day: 22, month: "May", year: "2024"), Tputs: 33, Bputs: 1, Wputs: 3, holePlayed: 18),
    ]
    
    // this to be changes each new roun
    static var emptyRound: Round {
        Round(shot: "", latitude: 0.0, longitude: 0.0, name: "", loc: "", par: 0, handicap: false, date: .init(day: 0, month: "", year: ""), Tputs: 0, Bputs: 0, Wputs: 0, holePlayed: 0)
    }
}
