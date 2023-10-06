//
//  ProfileViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 10/09/23.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    lazy var viewProfile: ProfileView = {
        let view = ProfileView()
        view.onTapEditProfile = { [weak self] in
            guard let self = self else { return }
            self.nextEditProfileStepOne()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = viewProfile
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationItem()
    }
    
    func setupNavigationItem() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
        
        if let navigationController = self.navigationController {
            navigationController.navigationBar.tintColor = UIColor.black
            let textAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24),
                                  NSAttributedString.Key.foregroundColor: UIColor.black]
            navigationController.navigationBar.titleTextAttributes = textAttributes
        }
    }
    
    private func nextEditProfileStepOne() {
        let coordinator = Coordinator(navigationController: navigationController)
        coordinator.startEditProfileStepOne()
    }
}
