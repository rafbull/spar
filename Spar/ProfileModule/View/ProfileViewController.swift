//
//  ProfileViewController.swift
//  Spar
//
//  Created by Rafis on 30.01.2024.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {
    
}

final class ProfileViewController: UIViewController {
    
    var presenter: ProfileViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ProfileViewController: ProfileViewProtocol {
    
}
