//
//  PlayerDetailViewController.swift
//  PlayerDetail
//
//  Created by Miguel Roncallo on 10/15/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Core

final class PlayerDetailViewController: BaseViewController<PlayerDetailPresenterType>, PlayerDetailViewType {
    
    private var playerDetailView: PlayerDetailUIType {
        return self.view as! PlayerDetailUIType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.bind(view: self)
        setupView()
        setPlayerdata()
    }
    
    private func setupView() {
        self.view = PlayerDetailView()
    }
    
    private func setPlayerdata() {
        self.playerDetailView.setPlayerData(player: self.presenter.getPlayerData())
    }
    
    
}
