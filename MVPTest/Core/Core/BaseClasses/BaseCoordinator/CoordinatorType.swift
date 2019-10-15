//
//  CoordinatorType.swift
//  Core
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation

public protocol CoordinatorType: AnyObject, Presentable {
    var childCoordinators: [CoordinatorType] { get set }
    var router: RouterType { get }
    func start()
}
