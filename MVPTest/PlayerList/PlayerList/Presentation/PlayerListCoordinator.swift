//
//  PlayerListCoordinator.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Core
import PlayerDetail

protocol PlayerListCoordinatorType: class {
    func navigatePlayerDetail(with player: Player)
}

final public class PlayerListCoordinator: BaseCoordinator {
    override public func start() {
        let moduleInput = PlayerListPresenter.ModuleInput.init(coordinator: self)
        
        guard let module = PlayerListConfigurator.module(moduleInput: moduleInput) else {
            return
        }
    
        self.router.setRootModule(module)
    }
    
    public override init(router: RouterType) {
        super.init(router: router)
    }
}

extension PlayerListCoordinator: PlayerListCoordinatorType{
    func navigatePlayerDetail(with player: Player){
        let coordinator = PlayerDetailCoordinator(router: self.router)
        self.addDependency(coordinator)
        coordinator.start(player: player)
    }
}
