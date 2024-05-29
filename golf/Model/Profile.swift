//
//  Profile.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import Foundation
import SwiftUI

struct Profile {
    @Environment(ModelData.self) var modelData
    var username: String
    var notifications: Bool = true
    var handicap: String = "12"
    var pic: Image {
        Image("jones")
    }
    
    static let `default` = Profile(username: "StingRox")
}
