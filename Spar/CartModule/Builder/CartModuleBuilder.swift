//
//  CartModuleBuilder.swift
//  Spar
//
//  Created by Rafis on 31.01.2024.
//

import UIKit

final class CartModuleBuilder: ModuleBuilderProtocol {

    func build() -> UIViewController {

        let viewController = CartViewController()
        let presenter = CartPresenter(viewController: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
