//
//  ProfileModuleBuilder.swift
//  Spar
//
//  Created by Rafis on 31.01.2024.
//

import UIKit

final class ProfileModuleBuilder: ModuleBuilderProtocol {

    func build() -> UIViewController {

        let viewController = ProfileViewController()
        let presenter = ProfilePresenter(viewController: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
