//
//  CatalogModuleBuilder.swift
//  Spar
//
//  Created by Rafis on 31.01.2024.
//

import UIKit

final class CatalogModuleBuilder: ModuleBuilderProtocol {

    func build() -> UIViewController {

        let viewController = CatalogViewController()
        let presenter = CatalogPresenter(viewController: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
