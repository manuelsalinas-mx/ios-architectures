//
//  DetailInteractor.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/10/24.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: DetailInteractorDelegateProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?

}

// MARK: - INTERACTOR <- DATA FROM REMOTE DATA MANAGER
extension DetailInteractor: DetailRemoteDataManagerDelegateProtocol {
    // TODO: Implement use case methods
}
