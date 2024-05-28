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
    var id: Int // unique round id
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
}
