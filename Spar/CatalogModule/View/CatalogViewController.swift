//
//  CatalogViewController.swift
//  Spar
//
//  Created by Rafis on 30.01.2024.
//

import UIKit

protocol CatalogViewProtocol: AnyObject {
    
}

final class CatalogViewController: UIViewController {
    
    var presenter: CatalogViewPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension CatalogViewController: CatalogViewProtocol {
    
}
