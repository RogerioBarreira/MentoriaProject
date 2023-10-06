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
    let vcProfile = ProfileViewController()
    let vcSettings = SettingsViewController()
    let vcSchedule = ScheduleViewController()
    
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
    
    func startEditProfileStepOne() {
        let vc = EditProfileStepOneViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func startEditProfileStepTwo() {
        let vc = EditProfileStepTwoViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func popVc() {
        let vc = ProfileViewController()
        self.navigationController.popToViewController(vc, animated: true)
    }
}
