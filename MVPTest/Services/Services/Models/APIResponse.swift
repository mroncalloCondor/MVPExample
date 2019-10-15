//
//  APIResponse.swift
//  Services
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

struct APIResponse<T: Codable>: Decodable {
    let data: T?
}

struct APIDataResponse {
    let data: Data?
    let error: Error?
}
