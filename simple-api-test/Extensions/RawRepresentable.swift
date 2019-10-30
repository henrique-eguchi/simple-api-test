//
//  RawRepresentable.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import Foundation

extension RawRepresentable where RawValue == String {
    var localized: String {
        return NSLocalizedString(rawValue, comment: String())
    }
}
