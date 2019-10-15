//
//  ClientType.swift
//  Services
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
import RxSwift

public protocol ClientType: AnyObject {
    func performOperation<T: Codable> (request: APIRequest) -> Single<T>
}
