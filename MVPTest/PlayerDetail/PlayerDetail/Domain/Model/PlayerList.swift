//
//  PlayerList.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

public struct PlayerList {
    public let playerList: [Player]
    
    public init(playerList: [Player]){
        self.playerList = playerList
    }
}

public struct Player {
    public let firstName: String
    public let position: String
    public let lastName: String
    public let weight: Int?
    public let feet: Int?
    public let inches: Int?
    public let team: Team
    
    public init(firstName: String, lastName: String, position: String, weight: Int?, feet: Int?, inches: Int?, team: Team){
        
        self.firstName = firstName
        self.lastName = lastName
        self.position = position
        self.weight = weight
        self.feet = feet
        self.inches = inches
        self.team = team
    }
}

public struct Team {
    public let abbreviation: String
    public let city: String
    public let division: String
    public let fullName: String
    
    public init(abbreviation: String, city: String, division: String, fullName: String){
        self.abbreviation = abbreviation
        self.city = city
        self.division = division
        self.fullName = fullName
    }
}
