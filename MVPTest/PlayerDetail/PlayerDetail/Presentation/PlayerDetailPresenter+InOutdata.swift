//
//  PlayerDetailPresenter+InOutdata.swift
//  PlayerDetail
//
//  Created by Miguel Roncallo on 10/15/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

extension PlayerDetailPresenter {
    enum OutputModuleActionType {
        
    }
    
    // MARK: - Initial module data
    struct ModuleInputData {
        let data: Player
    }
    
    // MARK: - Module input structure
    struct ModuleInput {
        let coordinator: PlayerDetailCoordinator
    }
    
    struct ModuleOutput {
        let moduleAction: OutputModuleActionType
    }
}
