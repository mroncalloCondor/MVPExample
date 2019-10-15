//
//  PlayerListRepository.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Services
import RxSwift

public final class PlayerListRepository: PlayerListRepositoryType {

    
    
    private let apiClient: APIClient
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func getPlayerList(page: Int, per_page: Int)  -> Single<PlayerList> {
        let params = ["page": page, "per_page": per_page]
        let request = PlayerListRequest(method: RequestType.get, path: "/players", parameters: params)
        
        return apiClient.performOperation(request: request).map({ (data: [APIPlayer]) in
            return PlayerListWrapper.map(data)
        })
    }
}
