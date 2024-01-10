//
//  DetailProtocols.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/10/24.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    func showLoading()
    func stopLoading()
    func showLabel(with info: String)
}

protocol DetailRouterProtocol: AnyObject {
    // PRESENTER -> ROUTER
    static func createDetailModule(with info: String) -> UIViewController
}

protocol DetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var router: DetailRouterProtocol? { get set }

    var info: String? { get set }
    func viewDidLoad()
}

protocol DetailInteractorDelegateProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
}

protocol DetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorDelegateProtocol? { get set }
    var localDatamanager: DetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol? { get set }
}

protocol DetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATA MANAGER
}

protocol DetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTE DATA MANAGER
    var remoteRequestHandler: DetailRemoteDataManagerDelegateProtocol? { get set }
    func fetchRemoteData()
}

protocol DetailRemoteDataManagerDelegateProtocol: AnyObject {
    // REMOTE DATA MANAGER -> INTERACTOR
}

protocol DetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCAL DATA MANAGER
}
