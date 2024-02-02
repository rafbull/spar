//
//  CartPresenter.swift
//  Spar
//
//  Created by Rafis on 31.01.2024.
//

import Foundation

protocol CartViewPresenterProtocol: AnyObject {
    init(viewController: CartViewProtocol)
}

final class CartPresenter: CartViewPresenterProtocol {
    weak var viewController: CartViewProtocol?
    
    init(viewController: CartViewProtocol) {
        self.viewController = viewController
    }
}
