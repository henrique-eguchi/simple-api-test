//
//  PunkAPI.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import Foundation

class PunkAPI {
    class func fetchBeersData(page: Int, completion: @escaping (Result<[Beer], Error>) -> ()) {
        let pageUrl =  Project.url + page.description
        guard let url = URL(string: pageUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            guard let decodedData = try? JSONDecoder().decode([Beer].self, from: data) else {
                guard let erro = err else { return }
                completion(Result.failure(erro))
                return
            }
            completion(Result.success(decodedData))
        }.resume()
    }
}
