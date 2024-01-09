//
//  DetailMovieMapper.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import Foundation

struct DetailMovieMapper {
    static func map(movie: DetailMovie) -> DetailMovieViewModel {
        .init(
            title: movie.title,
            overview: movie.overview,
            backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" +  movie.backdropPath))
        
    }
}
