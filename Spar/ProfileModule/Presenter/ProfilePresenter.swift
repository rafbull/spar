//
//  ProfilePresenter.swift
//  Spar
//
//  Created by Rafis on 31.01.2024.
//

import Foundation

protocol ProfileViewPresenterProtocol: AnyObject {
    init(viewController: ProfileViewProtocol)
}

final class ProfilePresenter: ProfileViewPresenterProtocol {
    weak var viewController: ProfileViewProtocol?
    
    init(viewController: ProfileViewProtocol) {
        self.viewController = viewController
    }
}
