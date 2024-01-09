//
//  DetailInteractor.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import Foundation

protocol DetailInteractable: AnyObject {
    func getDetailMovie(movieId: String) async -> DetailMovie
}

// MARK: - Interactor
class DetailInteractor: DetailInteractable {
    func getDetailMovie(movieId: String) async -> DetailMovie {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=2a60d0d48fb45b0054a05b71d5a1418e")!
        let (data, _ ) =  try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        return try! jsonDecoder.decode(DetailMovie.self, from: data)

    }
}
