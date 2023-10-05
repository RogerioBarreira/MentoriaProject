//
//  HomeTabBarController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 29/09/23.
//

import Foundation
import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTabBar()
        setupUI()
    }
    
    func customizeTabBar() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
        UITabBar.appearance().tintColor = UIColor.white
        tabBar.backgroundColor = UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)
        if let font = UIFont(name: "Helvetica", size: 12.0) {
            let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: UIColor.white]
            UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
        }
    }
    
    private func setupUI() {
        
        let vcProfile = ProfileViewController()
        let vcSettings = SettingsViewController()
        let vcSchedule = ScheduleViewController()
        
        let nav1 = UINavigationController(rootViewController: vcProfile)
        let nav2 = UINavigationController(rootViewController: vcSettings)
        let nav3 = UINavigationController(rootViewController: vcSchedule)
        
        
        nav1.tabBarItem = UITabBarItem(title: "Perfil", 
                                       image: UIImage(systemName: "person"),
                                       tag: 1)
        
        nav2.tabBarItem = UITabBarItem(title: "Servico", 
                                       image: UIImage(systemName: "wrench.and.screwdriver"),
                                       tag: 2)
        
        nav3.tabBarItem = UITabBarItem(title: "Agenda", 
                                       image: UIImage(systemName: "calendar"),
                                       tag: 3)
        
        setViewControllers([nav1, nav2, nav3], animated: true)
    }
}
