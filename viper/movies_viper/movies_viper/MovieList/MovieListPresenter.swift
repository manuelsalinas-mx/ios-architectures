//
//  MovieListPresenter.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import Foundation

protocol MovieListUI: AnyObject {
    func update(movies: [MovieCellViewModel])
}

protocol MovieListPresentable: AnyObject {
    var ui: MovieListUI? { get }
    var viewModels : [MovieCellViewModel] { get }
    func fecthMovies()
    func onTapCell(index: Int)
}

// MARK: - Presenter
class MovieListPresenter: MovieListPresentable {
    private let movieListInteractor: MovieListInteractable
    private let router: MovieListRouting
    private var movies :[Movie] = []
    weak var ui: MovieListUI?
    var viewModels : [MovieCellViewModel] = []


    init(movieListInteractor: MovieListInteractable, router: MovieListRouting) {
        self.movieListInteractor = movieListInteractor
        self.router = router
    }

    func fecthMovies() {
        Task {
            movies = await movieListInteractor.getMovies().results
            viewModels = MovieMapper.map(movies: movies)
            ui?.update(movies: viewModels)
        }
    }

    func onTapCell(index: Int) {
        let movieId = movies[index].id
        router.showDetailMovie(movieId: movieId.description)
    }
}
