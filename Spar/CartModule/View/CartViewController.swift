//
//  CartViewController.swift
//  Spar
//
//  Created by Rafis on 30.01.2024.
//

import UIKit

protocol CartViewProtocol: AnyObject {
    
}

final class CartViewController: UIViewController {
    
    var presenter: CartViewPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension CartViewController: CartViewProtocol {
    
}
