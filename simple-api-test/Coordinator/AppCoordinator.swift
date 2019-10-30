//
//  AppCoordinator.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    let beersCoordinator: BeersCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        
        beersCoordinator = BeersCoordinator(presenter: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        beersCoordinator.start()
    }
}
