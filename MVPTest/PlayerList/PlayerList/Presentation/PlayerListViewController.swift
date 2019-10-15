//
//  PlayerListViewController.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Core
import PlayerDetail

final class PlayerListViewController: BaseViewController<PLayerListPresenterType>,
PlayerListViewType {
    
    struct Constants {
        static let cellId = "cellId"
    }
    
    private var playerUIView: PlayerListUIType{
        return self.view as! PlayerListUIType
    }
    
    private var players = PlayerList(playerList: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.bind(view: self)
        setupView()
        self.presenter.getPlayersList()
    }
    
    private func setupView() {
        self.view = PlayerListView()
        let tableView = playerUIView.getTableView()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setTableViewData(playerList: PlayerList) {
        self.players = playerList
        self.playerUIView.getTableView().reloadData()
    }
    
}

extension PlayerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.navigateToPlayerDetail(with: self.players.playerList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId) as! PlayerListTableViewCell
        cell.setupCell(with: players.playerList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.players.playerList.count)
        return players.playerList.count
    }
}
