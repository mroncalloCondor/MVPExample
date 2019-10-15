//
//  PlayerListRequest.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import Services

public struct PlayerListRequest: APIRequest {
    public var method = RequestType.get
    
    public var path = "/players"
    
    public var parameters: [String : Any]?
    
    
}
