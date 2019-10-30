//
//  Beer.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import Foundation
import UIKit

struct Beer: Codable {
    let name: String?
    let tagline: String?
    let description: String?
    let imageURL: URL?
    let alcoholContent: Double?
    let bitternessScale: Double?
    
    enum CodingKeys: String, CodingKey {
        case name
        case tagline
        case description
        case imageURL = "image_url"
        case alcoholContent = "abv"
        case bitternessScale = "ibu"
   }
}
