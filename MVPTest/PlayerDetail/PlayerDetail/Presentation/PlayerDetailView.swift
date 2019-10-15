//
//  PlayerDetailView.swift
//  PlayerDetail
//
//  Created by Miguel Roncallo on 10/15/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import UIKit

final class PlayerDetailView: UIView, PlayerDetailUIType {
    
    private lazy var playerNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var playerPositionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var playerMainInfoVerticalStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.distribution = .fillProportionally
        view.alignment = .center
        return view
    }()
    
    private lazy var playerWeightLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    private lazy var playerHeightLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    private lazy var playerPhysicalInfoHorizontalStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
    
    
    private lazy var teamNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    private lazy var teamCityLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    private lazy var teamInfoHorizontalStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var playerPhysicalInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Physical Info"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private lazy var playerTeamInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Team"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private lazy var verticalContainer: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.distribution = UIStackView.Distribution.fillProportionally
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        self.clipsToBounds = true
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = .white
        playerMainInfoVerticalStack.addArrangedSubview(playerNameLabel)
        playerMainInfoVerticalStack.addArrangedSubview(playerPositionLabel)
        
        playerPhysicalInfoHorizontalStack.addArrangedSubview(playerHeightLabel)
        playerPhysicalInfoHorizontalStack.addArrangedSubview(playerWeightLabel)
        
        teamInfoHorizontalStack.addArrangedSubview(teamCityLabel)
        teamInfoHorizontalStack.addArrangedSubview(teamNameLabel)
        
        verticalContainer.addArrangedSubview(playerMainInfoVerticalStack)
        verticalContainer.addArrangedSubview(playerPhysicalInfoLabel)
        verticalContainer.addArrangedSubview(playerPhysicalInfoHorizontalStack)
        verticalContainer.addArrangedSubview(playerTeamInfoLabel)
        verticalContainer.addArrangedSubview(teamInfoHorizontalStack)
        
        self.addSubview(verticalContainer)
        verticalContainer.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 100, paddingLeft: 10, paddingBottom: 300, paddingRight: 10, width: 0, height: 0, enableInsets: false)
        
    }
    
    func setPlayerData(player: Player) {
        self.playerNameLabel.text = "\(player.firstName) \(player.lastName)"
        self.playerPositionLabel.text = player.position
        
        let heightFeet = (player.feet != nil) ? "\(player.feet!)" : "_"
        let heightInches = (player.inches != nil) ? "\(player.inches!)" : "_"
        self.playerHeightLabel.text = "Height \(heightFeet)ft \(heightInches)\""
        self.playerWeightLabel.text = (player.weight != nil) ? "\(player.weight!)lbs" : "_ lbs"
        
        self.teamNameLabel.text = "Team: \(player.team.fullName)"
        self.teamCityLabel.text = "City: \(player.team.city)"
    }
    
    
}
