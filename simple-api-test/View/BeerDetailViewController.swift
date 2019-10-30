//
//  BeerDetailViewController.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

    @IBOutlet weak var beerImageView: UIImageView?
    @IBOutlet weak var beerNameLabel: UILabel?
    @IBOutlet weak var beerTagLineLabel: UILabel?
    @IBOutlet weak var beerAlcoholContentLabel: UILabel?
    @IBOutlet weak var beerBitternessScaleLabel: UILabel?
    @IBOutlet weak var beerDescriptionLabel: UILabel?
    
    var viewModel: BeerDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBeerFields()
    }
    
    private func setupBeerFields() {
        guard let viewModel = viewModel else { return }

        if let userImageURL = viewModel.beer.imageURL {
            beerImageView?.imageFromURL(userImageURL)
        }
        
        beerNameLabel?.text = viewModel.beer.name
        beerTagLineLabel?.text = viewModel.beer.tagline
        beerAlcoholContentLabel?.text = "\(Project.Localizable.BeerDetail.alcoholContent.localized) \(viewModel.beer.alcoholContent.asOneFloatingPointFormattedString)%"
        beerBitternessScaleLabel?.text = "\(Project.Localizable.BeerDetail.bitternessScale.localized) \(viewModel.beer.bitternessScale.asOneFloatingPointFormattedString)"
        beerDescriptionLabel?.text = viewModel.beer.description
    }

}
