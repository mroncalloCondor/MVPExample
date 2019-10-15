//
//  PlayerDetailCoordinator.swift
//  PlayerDetail
//
//  Created by Miguel Roncallo on 10/15/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Core

protocol PlayerDetailCoordinatorType: class {
}
public final class PlayerDetailCoordinator: BaseCoordinator, PlayerDetailCoordinatorType {
    
    public func start(player: Player) {
        let moduleInputData = PlayerDetailPresenter.ModuleInputData(data: player)
        let moduleInput = PlayerDetailPresenter.ModuleInput(coordinator: self)
        
        let playerDetailModule = PlayerDetailConfigurator.configure(moduleInput: moduleInput, moduleInputData: moduleInputData)
        self.router.push(playerDetailModule)
    }
}
