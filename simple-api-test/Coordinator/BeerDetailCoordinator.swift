//
//  BeerDetailCoordinator.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 29/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import UIKit

class BeerDetailCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var beerDetailViewController: BeerDetailViewController?
    private let beer: Beer
    
    init(presenter: UINavigationController, beer: Beer) {
        self.beer = beer
        self.presenter = presenter
    }
    
    func start() {
        let beerDetailViewController = UIStoryboard.main.beerDetailViewController
        beerDetailViewController.title = "Details"
        beerDetailViewController.viewModel = BeerDetailViewModel(beer: beer)
        
        presenter.pushViewController(beerDetailViewController, animated: true)
        self.beerDetailViewController = beerDetailViewController
    }
    
}
