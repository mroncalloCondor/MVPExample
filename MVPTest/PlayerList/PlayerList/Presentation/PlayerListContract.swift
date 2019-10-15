//
//  PlayerListContract.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Core
import PlayerDetail

protocol PlayerListViewType {
    func setTableViewData(playerList: PlayerList)
}

protocol PLayerListPresenterType: BasePresenterType{
    func getPlayersList()
    func navigateToPlayerDetail(with player: Player)
}

protocol PlayerListUIType {
    func getTableView() -> UITableView
}
