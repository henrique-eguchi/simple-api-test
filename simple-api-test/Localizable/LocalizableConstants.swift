//
//  LocalizableConstants.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import Foundation


struct Project {
    
    static let url = "https://api.punkapi.com/v2/beers?page="
    
    enum Localizable {
        
        enum Beers: String {
            case alcoholContent = "beers.alcohol.content.label"
        }
        
        enum BeerDetail: String {
            case alcoholContent = "beers.beer.detail.alcohol.content.label"
            case bitternessScale = "beers.beer.detail.bitterness.scale.label"
        }
    }
    
}
