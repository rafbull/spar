//
//  TabBarControllerWithNavigation.swift
//  Spar
//
//  Created by Rafis on 30.01.2024.
//

import UIKit

private enum ControllerTitle {
    static let main = "Главная"
    static let catalog = "Каталог"
    static let cart = "Корзина"
    static let profile = "Профиль"
}

final class TabBarControllerWithNavigation: UITabBarController {
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarController()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    // MARK: - Initialization
    init(
        mainVC: UIViewController,
        catalogVC: UIViewController,
        cartVC: UIViewController,
        profileVC: UIViewController
    ) {
        mainViewController = mainVC
        сatalogViewController = catalogVC
        cartViewController = cartVC
        profileViewController = profileVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Properties
    var mainViewController: UIViewController
    var сatalogViewController: UIViewController
    var cartViewController: UIViewController
    var profileViewController: UIViewController
    
    // MARK: - Private Methods
    private func setupTabBarController() {
        view.backgroundColor = .systemBackground
        view.tintColor = .sparGreen
        
        let mainNav = createNav(for: mainViewController,
                                with: ControllerTitle.main,
                                and: UIImage(named: "SparLogo"))
        let сatalogNav = createNav(for: сatalogViewController,
                                   with: ControllerTitle.catalog,
                                   and: UIImage(systemName: "square.grid.2x2"))
        let cartNav = createNav(for: cartViewController,
                                with: ControllerTitle.cart,
                                and: UIImage(systemName: "cart"))
        let profileNav = createNav(for: profileViewController,
                                   with: ControllerTitle.profile,
                                   and: UIImage(systemName: "person"))
        
        self.setViewControllers([mainNav, сatalogNav, cartNav, profileNav], animated: true)
    }
    
    private func createNav(for vc: UIViewController, with title: String, and image: UIImage?) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}


