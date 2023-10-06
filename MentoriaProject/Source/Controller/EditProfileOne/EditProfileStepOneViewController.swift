//
//  EditProfileStepOneViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 06/10/23.
//

import Foundation
import UIKit

class EditProfileStepOneViewController: UIViewController {
    
    lazy var viewEditProfileStepOne: EditProfileStepOneView = {
        let view = EditProfileStepOneView()
        view.onTapContinues = { [weak self] in
            guard let self = self else { return }
            self.editProfileTap()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Etapa 1 de 2"
        setupNavigationItem()
    }
    
    override func loadView() {
        self.view = viewEditProfileStepOne
    }
    
    func setupNavigationItem() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .done,
            target: nil,
            action: nil
        )
        
        if let navigationController = self.navigationController {
            navigationController.navigationBar.tintColor = UIColor.white
            let textAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24),
                                  NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController.navigationBar.titleTextAttributes = textAttributes
        }
    }
    
    private func editProfileTap() {
        let coodinator = Coordinator(navigationController: navigationController)
        coodinator.startEditProfileStepTwo()
    }
}
