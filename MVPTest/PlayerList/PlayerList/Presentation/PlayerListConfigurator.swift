//
//  PlayerListConfigurator.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Core
import Services
import PlayerDetail

final class PlayerListConfigurator {
    static private var playerListRepository: PlayerListRepository?
    static private var playerListInteractor: SingleInteractor<PlayerList, PlayerListParams>?
    class func configure(moduleInput: PlayerListPresenter.ModuleInput) -> UIViewController {
        
        let dependencies =  self.createDependencies(coordinator: moduleInput.coordinator)
        let presenter = PlayerListPresenter(dependencies: dependencies)
        let viewController = PlayerListViewController(presenter: presenter)
        
        return viewController
    }
    
    private class func createDependencies(coordinator: PlayerListCoordinatorType) -> PlayerListPresenter.InputDependencies {
        self.playerListRepository = PlayerListRepository(apiClient: APIClient())
        self.playerListInteractor = GetPlayerListInteractor(playerListRepository: playerListRepository!)
        let dependencies = PlayerListPresenter.InputDependencies(coordinator: coordinator,
                                                                 getPlayerListInteractor: self.playerListInteractor!)
        
        return dependencies
    }
    
    static func module(moduleInput: PlayerListPresenter.ModuleInput) -> (UIViewController)? {
            let output = PlayerListConfigurator.configure(moduleInput: moduleInput)
            return output
    }
}
