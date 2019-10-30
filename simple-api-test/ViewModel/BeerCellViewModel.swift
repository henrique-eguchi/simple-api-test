//
//  BeerCellViewModel.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import Foundation

struct BeerCellViewModel {
    
    let imageURL: URL?
    let name: String?
    let alcoholContent: Double?

    init(beer: Beer) {
        self.imageURL = beer.imageURL
        self.name = beer.name
        self.alcoholContent = beer.alcoholContent
    }
}
