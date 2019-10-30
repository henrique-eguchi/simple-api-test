//
//  LoadingTableViewCell.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 29/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var loadingSign: UIActivityIndicatorView!
    
    static let cellIdentifier = "LoadingItemCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
