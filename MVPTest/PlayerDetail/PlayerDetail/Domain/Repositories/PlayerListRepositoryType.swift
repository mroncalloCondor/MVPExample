//
//  PlayerListRepositoryType.swift
//  PlayerList
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import RxSwift

public protocol PlayerListRepositoryType: AnyObject {
    func getPlayerList(page: Int, per_page: Int) -> Single<PlayerList>
}
