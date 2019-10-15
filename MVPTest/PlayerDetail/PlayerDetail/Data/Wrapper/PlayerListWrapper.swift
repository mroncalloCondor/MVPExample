//
//  PlayerListWrapper.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
public final class PlayerListWrapper{
    static func map(_ apiPlayerList: [APIPlayer]) -> PlayerList{
        let players = apiPlayerList
        
        var playerList = [Player]()
        
        for player in players {
            let team = Team(abbreviation: player.team.abbreviation, city: player.team.city, division: player.team.division, fullName: player.team.fullName)
            playerList.append(Player(firstName: player.firstName, lastName: player.lastName, position: player.position, weight: player.weightPounds, feet: player.heightFeet, inches: player.heightInches, team: team))
        }
        return PlayerList(playerList: playerList)
    }
}
