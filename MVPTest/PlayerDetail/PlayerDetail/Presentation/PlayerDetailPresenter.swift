//
//  PlayerDetailPresenter.swift
//  PlayerDetail
//
//  Created by Miguel Roncallo on 10/15/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Core

final class PlayerDetailPresenter: BasePresenter<PlayerDetailViewType>, PlayerDetailPresenterType{

    struct InputDependencies {
        weak var coordinator: PlayerDetailCoordinatorType?
    }
    
    private let dependencies: InputDependencies
    private let player: Player
    
    init(dependencies: InputDependencies, player: Player){
        self.dependencies = dependencies
        self.player = player
        super.init()
    }
    
    func getPlayerData() -> Player {
        return self.player
    }
}
