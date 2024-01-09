//
//  DetailMovie.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import Foundation

struct DetailMovie: Decodable {
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
}
