//
//  DetailPresenter.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/10/24.
//  
//

import Foundation

class DetailPresenter: DetailPresenterProtocol  {

    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    var info: String?

    func viewDidLoad() {
        guard let info else { return }
        print(info)
        view?.showLabel(with: info)
    }
}

// MARK: - PRESENTER <- DATA FROM INTERACTOR
extension DetailPresenter: DetailInteractorDelegateProtocol {
    // TODO: implement interactor Delegate methods
}
