//
//  DetailRouter.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import UIKit

protocol DetailRouting: AnyObject {
    func showDetail(fromController: UIViewController, movieId: String)
}

// MARK: - Router
class DetailRouter: DetailRouting {
    func showDetail(fromController: UIViewController, movieId: String) {
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(movieId: movieId, interactor: interactor)

        let view = DetailView(presenter: presenter)
        presenter.ui = view

        fromController.present(view, animated: true)
    }
}
