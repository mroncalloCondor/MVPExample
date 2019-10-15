//
//  PlayerListPresenter.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Core
import PlayerDetail

final class PlayerListPresenter: BasePresenter<PlayerListViewType>, PLayerListPresenterType {
    
    struct InputDependencies {
        weak var coordinator: PlayerListCoordinatorType?
        weak var getPlayerListInteractor: SingleInteractor<PlayerList, PlayerListParams>?
    }
    
    private let dependencies: InputDependencies
    
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
        super.init()
    }
    
    func getPlayersList(){
        print("executing")
        self.dependencies.getPlayerListInteractor?.params(PlayerListParams(page: 0, perPage: 25)).onSuccess({ [weak self] playerList in
            self?.view?.setTableViewData(playerList: playerList)
        }).onError({ (error) in
            print(error)
        }).execute()
    }
    
    func navigateToPlayerDetail(with player: Player) {
        self.dependencies.coordinator?.navigatePlayerDetail(with: player)
    }
    
}
