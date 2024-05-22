//
//  Course.swift
//  golf
//
//  Created by Aidan James on 2024-05-21.
//

import Foundation
import CoreLocation
import SwiftUI

struct Course: Hashable, Codable, Identifiable {
    var id: Int // unique
    var name: String // course name
    var loc: String // location of course
    var holes: Int // number of holes on the course
    var ninePar: Int // par for 9 holes
    var nineDis: Int // distance for 9 holes
    var ePar: Int // par for 18 holes
    var eDist: Int // distance for 18 holes
    
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
    
    var website: String // course's website
    var review: Int // user rating of the course (0 default)
}
