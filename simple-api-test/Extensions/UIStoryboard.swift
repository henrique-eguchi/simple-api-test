//
//  UIStoryboard.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    @nonobjc static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    var beersViewController: BeersViewController {
        guard let viewController =
            UIStoryboard.main.instantiateViewController(withIdentifier: "BeersViewController") as? BeersViewController else {
                fatalError("ListViewController couldn't be found in Storyboard file")
        }
        return viewController
    }
    
    var beerDetailViewController: BeerDetailViewController {
        guard let viewController =
            UIStoryboard.main.instantiateViewController(withIdentifier: "BeerDetailViewController") as? BeerDetailViewController else {
                fatalError("DetailViewController couldn't be found in Storyboard file")
        }
        return viewController
    }
}
