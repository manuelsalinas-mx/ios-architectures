//
//  DetailPresenter.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import Foundation

protocol DetailPresenterUI: AnyObject {
    func updateUI(viewModel: DetailMovieViewModel)
}

protocol DetailPresentable: AnyObject {
    var ui: DetailPresenterUI? { get }
    var movieId: String  { get }
    func getMovieDetail()
}

// MARK: - Presenter
class DetailPresenter: DetailPresentable {
    private let interactor: DetailInteractable
    weak var ui: DetailPresenterUI?
    let movieId: String

    init(movieId: String, 
         interactor: DetailInteractable) {
        self.movieId = movieId
        self.interactor = interactor
    }

    func getMovieDetail() {
        Task {
            let model = await interactor.getDetailMovie(movieId: movieId)
            let viewModel = DetailMovieMapper.map(movie: model)
            print(model)

            await MainActor.run {
                self.ui?.updateUI(viewModel:viewModel)
                print(viewModel)
            }
        }
    }

}
