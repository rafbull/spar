//
//  SceneDelegate.swift
//  Spar
//
//  Created by Rafis on 30.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let mainViewController = MainModuleBuilder().build()
        let сatalogViewController = CatalogModuleBuilder().build()
        let cartViewController = CartModuleBuilder().build()
        let profileViewController = ProfileModuleBuilder().build()
        
        let tabBarController = TabBarControllerWithNavigation(
            mainVC: mainViewController,
            catalogVC: сatalogViewController,
            cartVC: cartViewController,
            profileVC: profileViewController
        )
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

