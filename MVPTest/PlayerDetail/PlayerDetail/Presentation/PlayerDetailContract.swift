//
//  PlayerDetailContract.swift
//  PlayerDetail
//
//  Created by Miguel Roncallo on 10/15/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Core

protocol PlayerDetailPresenterType: BasePresenterType {
    func getPlayerData() -> Player
}

protocol PlayerDetailViewType{
}
protocol PlayerDetailUIType {
    func setPlayerData(player: Player)
}
