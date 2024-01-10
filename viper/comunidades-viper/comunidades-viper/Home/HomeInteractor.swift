//
//  HomeInteractor.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/9/24.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: HomeInteractorDelegateProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?

    func getData() {
        print("Asking for data...")
        remoteDatamanager?.fetchRemoteData()
    }
}

// MARK: - HomeRemoteDataManagerDelegateProtocol
extension HomeInteractor: HomeRemoteDataManagerDelegateProtocol {
    // TODO: Implement use case methods
    func remoteDataReceived(_ categories: [CategoryURL]) {
        let refs = categories.map({ $0.links.mySelf.first?.href ?? ""})
        presenter?.categoriesFromInteractor(categories: refs)
    }
}
