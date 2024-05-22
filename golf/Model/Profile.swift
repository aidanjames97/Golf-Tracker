//
//  Profile.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import Foundation

struct Profile {
    var username: String
    var notifications: Bool = true
    var handicap: String = "12"
    
    static let `default` = Profile(username: "StingRox")
}
