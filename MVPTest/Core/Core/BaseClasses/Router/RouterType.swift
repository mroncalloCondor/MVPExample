//
//  RouterType.swift
//  Core
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import Foundation
public protocol RouterType: AnyObject, Presentable {
    var navigationController: UINavigationController { get }
    var rootViewController: UIViewController? { get }
    
    func push(_ module: Presentable)
    
    func popModule()
    
    func dismissModule()
    
    func setRootModule(_ module: Presentable)
}
