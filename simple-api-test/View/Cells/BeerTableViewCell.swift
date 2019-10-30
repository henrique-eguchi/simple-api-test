//
//  BeerTableViewCell.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var beerImageView: UIImageView?
    @IBOutlet weak var beerNameLabel: UILabel?
    @IBOutlet weak var beerAlcoholContentLabel: UILabel?
    
    static let cellIdentifier = "BeerItemCell"
    
    var viewModel: BeerCellViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        guard let viewModel = viewModel else { return }

        beerNameLabel?.text = viewModel.name
        
        beerAlcoholContentLabel?.text = "\(Project.Localizable.Beers.alcoholContent.localized) \(viewModel.alcoholContent.asOneFloatingPointFormattedString)%"

        if let userImageURL = viewModel.imageURL {
            beerImageView?.imageFromURL(userImageURL)
        }
    }
    
}
