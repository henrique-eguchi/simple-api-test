//
//  Double.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 29/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import Foundation

extension Optional where Wrapped == Double {
    var asOneFloatingPointFormattedString: String {
        return String(format: "%.1f", self ?? "-")
    }
}
