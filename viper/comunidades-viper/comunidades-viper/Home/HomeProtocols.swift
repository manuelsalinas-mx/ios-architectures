//
//  HomeProtocols.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/9/24.
//
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    func categoriesFromPresenter(_ categories: [String])
    func showLoading()
    func stopLoading()
}

protocol HomeRouterProtocol: AnyObject {
    // PRESENTER -> ROUTER
    static func createHomeModule() -> UIViewController
    func presentDetailView(from view: HomeViewProtocol, info: String)
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }

    func viewDidLoad()
    func presentDetail(with info: String)
}

protocol HomeInteractorDelegateProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func categoriesFromInteractor(categories: [String])
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorDelegateProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    func getData()
}

protocol HomeDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerDelegateProtocol? { get set }
    func fetchRemoteData()
}

protocol HomeRemoteDataManagerDelegateProtocol: AnyObject {
    // REMOTE DATA MANAGER -> INTERACTOR
    func remoteDataReceived(_ categories: [CategoryURL])
}

protocol HomeLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
