//
//  HomeRemoteDataManager.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/9/24.
//
//

import Foundation

class HomeRemoteDataManager: HomeRemoteDataManagerInputProtocol {
    var remoteRequestHandler: HomeRemoteDataManagerDelegateProtocol?

    func fetchRemoteData() {
        print("Requesting endpoint...")
        Task {
            do {
                let url = URL(string: "https://cfeapps.com/wp-json/wp/v2/categories")!
                let (data, _ ) =  try! await URLSession.shared.data(from: url)
                let categories =  try JSONDecoder().decode([CategoryURL].self, from: data)
                
                remoteRequestHandler?.remoteDataReceived(categories)
            } catch let error {
                print(error.localizedDescription)
            }

        }
    }
}
