//
//  PlayerListTableViewCell.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import UIKit
import Core
import PlayerDetail

class PlayerListTableViewCell: UITableViewCell {

    private lazy var playerNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private lazy var playerPositionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private lazy var playerHeightLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    private lazy var playerTeamLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    private lazy var playerWeightLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    private lazy var playerNameHorizontalStackView: UIStackView = {
       let view = UIStackView()
        view.distribution = UIStackView.Distribution.fillEqually
        view.spacing = 50
        view.alignment = .center
        view.axis = .horizontal
        return view
    }()
    
    private lazy var playerInfoHorizontalStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        view.axis = .horizontal
        return view
    }()
    
    private lazy var stackContainer: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with player: Player) {
        self.playerNameLabel.text = "\(player.firstName) \(player.lastName)"
        self.playerPositionLabel.text = player.position
        self.playerTeamLabel.text = player.team.fullName
        let heightFeet = (player.feet != nil) ? "\(player.feet!)" : "_"
        let heightInches = (player.inches != nil) ? "\(player.inches!)" : "_"
        self.playerHeightLabel.text = "Height \(heightFeet)ft \(heightInches)\""
        self.playerWeightLabel.text = (player.weight != nil) ? "\(player.weight!)lbs" : "_ lbs"
    }
    
    private func setupView() {
        self.playerNameHorizontalStackView.addArrangedSubview(playerNameLabel)
        self.playerNameHorizontalStackView.addArrangedSubview(playerPositionLabel)
        
        self.playerInfoHorizontalStackView.addArrangedSubview(playerTeamLabel)
        self.playerInfoHorizontalStackView.addArrangedSubview(playerHeightLabel)
        self.playerInfoHorizontalStackView.addArrangedSubview(playerWeightLabel)
        
        self.stackContainer.addArrangedSubview(playerNameHorizontalStackView)
        self.stackContainer.addArrangedSubview(playerInfoHorizontalStackView)
        
        self.contentView.addSubview(self.stackContainer)
        stackContainer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 150, enableInsets: false)
    }
}
