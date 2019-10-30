//
//  BeersViewModel.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import Foundation

protocol FetchBeersDelegate: class {
    func fetchBeersSuccess()
    func fetchBeersFailure()
}

protocol BeersNavigationDelegate: class {
    func beerSelected(_ beer: Beer)
}

class BeersViewModel {
    
    private var beers: [Beer]
    private var isFetchInProgress: Bool
    private var currentPage: Int

    weak var delegate: FetchBeersDelegate?
    weak var navigationDelegate: BeersNavigationDelegate?
    
    init() {
        self.beers = []
        self.isFetchInProgress = false
        self.currentPage = 1
    }
    
    func fetchBeers() {
        
        guard !isFetchInProgress else { return }
        
        isFetchInProgress = true
        
        PunkAPI.fetchBeersData(page: currentPage) { result in
            switch result {
            case .failure:
                self.isFetchInProgress = false
                self.delegate?.fetchBeersFailure()
            
            case .success(let response):
                self.currentPage += 1
                self.isFetchInProgress = false
                
                self.beers.append(contentsOf: response)
                DispatchQueue.main.async {
                    if self.currentPage > 1 {
                        self.delegate?.fetchBeersSuccess()
                    } else {
                        self.delegate?.fetchBeersSuccess()
                    }
                }
            }
        }
    }
    
    func numberOfBeers() -> Int {
        return beers.count
    }
    
    func viewModelForItemAt(indexPath: IndexPath) -> BeerCellViewModel {
        let beer = beers[indexPath.row]
        return BeerCellViewModel(beer: beer)
    }
    
    func showBeerDetailsAt(indexPath: IndexPath) {
        let beer = beers[indexPath.row]
        navigationDelegate?.beerSelected(beer)
    }
    
}
