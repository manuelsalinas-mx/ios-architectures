//
//  SceneDelegate.swift
//  movies_viper
//
//  Created by Manuel Salinas on 1/8/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var movieListRouter = MovieListRouter()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let widnowsScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: widnowsScene)
        movieListRouter.showMovieList(window: window)
    }
}

