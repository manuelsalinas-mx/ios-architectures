//
//  DetailRouter.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/10/24.
//  
//

import Foundation
import UIKit

class DetailRouter: DetailRouterProtocol {
    static func createDetailModule(with info: String) -> UIViewController {
        if let view = mainStoryboard.instantiateViewController(withIdentifier: "DetailView") as? DetailView {
            let presenter: DetailPresenterProtocol & DetailInteractorDelegateProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerDelegateProtocol = DetailInteractor()
            let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
            let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
            let router: DetailRouterProtocol = DetailRouter()

            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            presenter.info = info
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor

            return view
        }
        return UIViewController()
    }

    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }

}
