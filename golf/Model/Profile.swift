//
//  Profile.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Profile {
    var username: String
    var notifications: Bool
    var handicap: String
    var image: Image {
        Image("jones")
    }
    
    public init(username: String, notifications: Bool, handicap: String) {
        self.username = username
        self.notifications = notifications
        self.handicap = handicap
    }
    
    static let sampleProfile: Profile = Profile(username: "StingRox", notifications: true, handicap: "22")
    static let draftProfile: Profile = Profile(username: "", notifications: false, handicap: "")
}
