//
//  BeersCoordinator.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import UIKit

class BeersCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var beersViewController: BeersViewController?
    private var beerDetailCoordinator: BeerDetailCoordinator?

    init(presenter: UINavigationController) {
        self.presenter = presenter
    }

    func start() {
        let beersViewController = UIStoryboard.main.beersViewController
        beersViewController.title = "Beers"
        
        let beersViewModel = BeersViewModel()
        beersViewController.viewModel = beersViewModel
        
        beersViewModel.navigationDelegate = self
        beersViewModel.delegate = beersViewController
        
        presenter.pushViewController(beersViewController, animated: true)
        
        self.beersViewController = beersViewController
    }
}

extension BeersCoordinator: BeersNavigationDelegate {
    func beerSelected(_ beer: Beer) {
        let beerDetailCoordinator = BeerDetailCoordinator(presenter: presenter, beer: beer)
        beerDetailCoordinator.start()
        
        self.beerDetailCoordinator = beerDetailCoordinator
    }
}
