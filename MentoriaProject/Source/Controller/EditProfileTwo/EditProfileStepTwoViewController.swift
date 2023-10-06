//
//  EditProfileTwoViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 06/10/23.
//

import Foundation
import UIKit

class EditProfileStepTwoViewController: UIViewController {
    
    lazy var viewEditProfileTwo: EditProfileStepTwoView = {
        let view = EditProfileStepTwoView()
        view.onTapButtonConfirm = { [weak self] in
            guard let self = self else { return }
            self.tapButtonConfirm()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Etapa 2 de 2"
        setupNavigationItem()
    }
    
    override func loadView() {
        self.view = viewEditProfileTwo
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
    
    private func tapButtonConfirm() {
        if let vc = navigationController?.viewControllers.first(where: { $0 is ProfileViewController }) {
            navigationController?.popToViewController(vc, animated: true)
        } else {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
