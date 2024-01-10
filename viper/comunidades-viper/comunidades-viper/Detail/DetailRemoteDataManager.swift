//
//  DetailRemoteDataManager.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/10/24.
//  
//

import Foundation

class DetailRemoteDataManager: DetailRemoteDataManagerInputProtocol {

    var remoteRequestHandler: DetailRemoteDataManagerDelegateProtocol?
    
    func fetchRemoteData() {
        Task {
            do {
                let url = URL(string: "https://yourApi/version/method")!
                let (data, _ ) =  try! await URLSession.shared.data(from: url)
                let item =  try JSONDecoder().decode(String.self, from: data)

                //remoteRequestHandler?._method_
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
    }
}
