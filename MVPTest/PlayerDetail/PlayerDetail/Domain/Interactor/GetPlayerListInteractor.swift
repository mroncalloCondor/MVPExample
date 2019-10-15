//
//  GetPlayerListInteractor.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Core
import RxSwift

public struct PlayerListParams {
    let page: Int
    let per_page: Int
    
    public init(page: Int, perPage: Int) {
        self.page = page
        self.per_page = perPage
    }
    
}

public final class GetPlayerListInteractor: SingleInteractor<PlayerList, PlayerListParams> {
    weak var playerListRepository: PlayerListRepositoryType?
    public init(playerListRepository: PlayerListRepositoryType){
        self.playerListRepository = playerListRepository
    }
    
    public override func buildUseCase(params: PlayerListParams?) -> Single<PlayerList> {
        return self.playerListRepository!.getPlayerList(page: params!.page, per_page: params!.per_page)
    }
}
