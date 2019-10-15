//
//  PlayerDetailConfigurator.swift
//  PlayerDetail
//
//  Created by Miguel Roncallo on 10/15/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

final class PlayerDetailConfigurator {
    
    class func configure(moduleInput: PlayerDetailPresenter.ModuleInput,
                         moduleInputData: PlayerDetailPresenter.ModuleInputData) -> UIViewController{
        let dependencies = PlayerDetailPresenter.InputDependencies(
            coordinator: moduleInput.coordinator)
        let presenter = PlayerDetailPresenter(dependencies: dependencies, player: moduleInputData.data)
        let viewContoller = PlayerDetailViewController(presenter: presenter)
        
        return viewContoller
    }
    
    static func module(
        moduleInput: PlayerDetailPresenter.ModuleInput,
        moduleInputData: PlayerDetailPresenter.ModuleInputData) -> UIViewController {
        let output = PlayerDetailConfigurator.configure(
            moduleInput: moduleInput,
            moduleInputData: moduleInputData)
        return output
    }
}
