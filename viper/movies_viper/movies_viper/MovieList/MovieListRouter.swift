//
//  MovieListRouter.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import Foundation
import UIKit

protocol MovieListRouting: AnyObject {
    var movieListView: MovieListView? { get }
    var detailRouter: DetailRouting? { get }
    func showMovieList(window: UIWindow?)
    func showDetailMovie(movieId: String)
}

// MARK: - Router
class MovieListRouter: MovieListRouting {
    var detailRouter: DetailRouting?
    var movieListView: MovieListView?
    
    func showMovieList(window: UIWindow?) {
        self.detailRouter = DetailRouter()
        
        let interactor = MovieListInteractor()
        let presenter =  MovieListPresenter(movieListInteractor: interactor, router: self)
        movieListView = MovieListView(presenter: presenter)
        presenter.ui = movieListView
        
        
        window?.rootViewController = movieListView
        window?.makeKeyAndVisible()
    }
    
    func showDetailMovie(movieId: String) {
        guard let controller = movieListView else { return }
        detailRouter?.showDetail(fromController: controller, movieId: movieId)
    }
}
