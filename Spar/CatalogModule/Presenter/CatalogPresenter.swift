//
//  CatalogPresenter.swift
//  Spar
//
//  Created by Rafis on 31.01.2024.
//

import Foundation

protocol CatalogViewPresenterProtocol: AnyObject {
    init(viewController: CatalogViewProtocol)
}

final class CatalogPresenter: CatalogViewPresenterProtocol {
    weak var viewController: CatalogViewProtocol?
    
    init(viewController: CatalogViewProtocol) {
        self.viewController = viewController
    }
}
