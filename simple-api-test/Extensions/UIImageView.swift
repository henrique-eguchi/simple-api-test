//
//  UIImageView.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func imageFromURL(_ imageURL: URL) {
        
        // Check for cache
        if let cachedImage = imageCache.object(forKey: imageURL.absoluteString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        
        // Download image
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: imageURL.absoluteString as AnyObject)
                    self.image = image
                }
            })
            }.resume()
    }
    
}
