//
//  PlayerListView.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

final class PlayerListView: UIView, PlayerListUIType{
    
    struct Constants{
        static let cellId = "cellId"
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func getTableView() -> UITableView {
        return self.tableView
    }
    
    private func setupTableView() {
        self.tableView.register(PlayerListTableViewCell.self, forCellReuseIdentifier: Constants.cellId)
        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.addSubview(tableView)
        setupTableView()
    }
    
}
