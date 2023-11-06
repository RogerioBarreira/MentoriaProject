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
    let vcService = ServiceListViewController()
    let vcSchedule = ScheduleViewController()
    
    init(navigationController: UINavigationController?) {
        if navigationController == nil {
            self.navigationController = UINavigationController()
        }
        self.navigationController = navigationController ?? UINavigationController()
    }
    
    func startServiceResgister(selectIndex: IndexPath?) {
        let vc = ServiceRegisterViewController()
        vc.selectedRowIndex = selectIndex
        self.navigationController.pushViewController(vc, animated: true)
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
    
    func startEditProfileStepTwo(name: String, phone: String, cpf: String, typeOfActivity: String, birthdate: String) {
        let vc = EditProfileStepTwoViewController()
        vc.viewModel.getValuesPerfiOne(name: name, phone: phone, cpf: cpf, typeOfActivity: typeOfActivity, birthdate: birthdate)
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func popVc() {
        let vc = ProfileViewController()
        self.navigationController.popToViewController(vc, animated: true)
    }
}
