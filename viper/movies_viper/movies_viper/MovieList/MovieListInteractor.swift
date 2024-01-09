//
//  MovieListInteractor.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import Foundation

//2a60d0d48fb45b0054a05b71d5a1418e

protocol MovieListInteractable: AnyObject {
    func getMovies() async -> MovieResponse
}

// MARK: - Interactor
class MovieListInteractor: MovieListInteractable {
    func getMovies() async -> MovieResponse {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=2a60d0d48fb45b0054a05b71d5a1418e")!
        let (data, _ ) =  try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(MovieResponse.self, from: data)
    }
}


// MARK: - Mocking Class
class MovieListInteractorMock: MovieListInteractable {
    func getMovies() async -> MovieResponse {
        return MovieResponse(results: [
            .init(id: 0, title: "Matrix", overview: "Lipsum silum", imageUrl: "", votes: 10),
            .init(id: 1, title: "Matrix II", overview: "Lipsum silum", imageUrl: "", votes: 10),
            .init(id: 2, title: "Matrix III", overview: "Lipsum silum", imageUrl: "", votes: 10),
            .init(id: 3, title: "Matrix IV", overview: "Lipsum silum", imageUrl: "", votes: 10),
        ])
    }
}
