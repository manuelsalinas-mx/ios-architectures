//
//  HomePresenter.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/9/24.
//  
//

import Foundation
import UIKit

class HomePresenter: HomePresenterProtocol  {

    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?

    func viewDidLoad() {
        print("Loading data...")
        view?.showLoading()
        interactor?.getData()
    }

    func presentDetail(with info: String) {
        guard let view else { return }
        router?.presentDetailView(from: view, info: info)
    }
}

// MARK: - HomeInteractorDelegateProtocol
extension HomePresenter: HomeInteractorDelegateProtocol {
    // TODO: implement interactor output methods
    func categoriesFromInteractor(categories: [String]) {
        view?.categoriesFromPresenter(categories)
        view?.stopLoading()
    }
}
