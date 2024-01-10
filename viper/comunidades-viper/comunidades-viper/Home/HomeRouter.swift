//
//  HomeRouter.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/9/24.
//  
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    static func createHomeModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "NavHome")
        if let view = navController.children.first as? HomeView {
            let presenter: HomePresenterProtocol & HomeInteractorDelegateProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerDelegateProtocol = HomeInteractor()
            let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            let router: HomeRouterProtocol = HomeRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeView", bundle: Bundle.main)
    }
    
    func presentDetailView(from view: HomeViewProtocol, info: String) {
        guard let view = view as? UIViewController else { return }

        let detailView = DetailRouter.createDetailModule(with: info)
        view.navigationController?.pushViewController(detailView, animated: true)
    }
}
