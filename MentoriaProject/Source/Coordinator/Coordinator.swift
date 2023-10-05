//
//  Coordinator.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 10/09/23.
//

import Foundation
import UIKit

class Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController?) {
        if navigationController == nil {
            self.navigationController = UINavigationController()
        }
        self.navigationController = navigationController ?? UINavigationController()
    }
    
    func start() {
        let vc = LoginViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func startRegister() {
        let vc = RegisterViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func startProfile() {
        let vc = ProfileViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func startTabBar() {
        let vc = HomeTabBarController()
        self.navigationController.pushViewController(vc, animated: true)
    }
}
