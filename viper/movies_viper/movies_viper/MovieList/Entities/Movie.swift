//
//  Movie.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import Foundation

struct Movie: Decodable {
    var id: Int
    var title: String
    var overview: String
    var imageUrl: String
    var votes: Double

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imageUrl = "poster_path"
        case votes = "vote_average"
    }
}
