//
//  MainModuleBuilder.swift
//  Spar
//
//  Created by Rafis on 30.01.2024.
//

import UIKit

final class MainModuleBuilder: ModuleBuilderProtocol {
    
    func build() -> UIViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter(viewController: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
