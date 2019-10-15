//
//  APIPlayerList.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Services


import Foundation

public struct APIPlayer: Codable {
    let id: Int
    let firstName: String
    let heightFeet, heightInches: Int?
    let lastName, position: String
    let team: APITeam
    let weightPounds: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case heightFeet = "height_feet"
        case heightInches = "height_inches"
        case lastName = "last_name"
        case position, team
        case weightPounds = "weight_pounds"
    }
}

// MARK: - Team
public struct APITeam: Codable {
    let id: Int
    let abbreviation, city: String
    let division, fullName, name: String
    
    enum CodingKeys: String, CodingKey {
        case id, abbreviation, city, division
        case fullName = "full_name"
        case name
    }
}
