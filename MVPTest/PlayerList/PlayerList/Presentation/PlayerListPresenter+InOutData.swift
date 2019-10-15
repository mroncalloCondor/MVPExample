//
//  PlayerListPresenter+InOutData.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

extension PlayerListPresenter {
    enum OutputModuleActionType {
        
    }
    
    // MARK: - initial module data
    struct ModuleInputData {
        
    }
    
    // MARK: - module input structure
    struct ModuleInput {
        let coordinator: PlayerListCoordinatorType
    }
    
    // MARK: - module output structure
    struct ModuleOutput {
        let moduleAction: OutputModuleActionType
    }
}
