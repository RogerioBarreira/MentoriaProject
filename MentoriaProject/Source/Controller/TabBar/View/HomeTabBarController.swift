//
//  HomeTabBarController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 29/09/23.
//

import Foundation
import UIKit

class HomeTabBarController: UITabBarController {
    
    let viewModel = HomeTabbarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTabBar()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        setupNavigationItem()
    }
    
    func setupNavigationItem() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .done,
            target: nil,
            action: nil
        )
        
        if let viewControllers = navigationController?.viewControllers, viewControllers.count > 1 {
            var newViewControllers = viewControllers
            newViewControllers.remove(at: viewControllers.count - 2)
            navigationController?.viewControllers = newViewControllers
        }
        
        if let navigationController = self.navigationController {
            navigationController.navigationBar.tintColor = UIColor.white
            let textAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24),
                                  NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController.navigationBar.titleTextAttributes = textAttributes
        }
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
        
        let nav = Coordinator(navigationController: navigationController)
        
        nav.vcProfile.tabBarItem = UITabBarItem(title: "Perfil",
                                       image: UIImage(systemName: "person"),
                                       tag: 1)
        
        nav.vcService.tabBarItem = UITabBarItem(title: "Servico",
                                       image: UIImage(systemName: "wrench.and.screwdriver"),
                                       tag: 2)
        
        nav.vcSchedule.tabBarItem = UITabBarItem(title: "Agenda",
                                       image: UIImage(systemName: "calendar"),
                                       tag: 3)
        
        setViewControllers([nav.vcProfile, nav.vcService, nav.vcSchedule], animated: true)
    }
}
