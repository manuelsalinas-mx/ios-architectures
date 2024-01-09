//
//  MovieMapper.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import Foundation

struct MovieMapper {
    static func map(movies: [Movie]) -> [MovieCellViewModel] {
        movies.map({ MovieCellViewModel(
            title: $0.title,
            overview: $0.overview,
            imageUrl: URL(string: "https://image.tmdb.org/t/p/w200" +  $0.imageUrl))
        })
    }
}
