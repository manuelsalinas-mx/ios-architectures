//
//  MovieResponse.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}
