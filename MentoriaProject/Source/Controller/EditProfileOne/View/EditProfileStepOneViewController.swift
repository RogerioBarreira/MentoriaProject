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
        view.onError = { [weak self] title, error in
            guard let self = self else { return }
            self.showMessageError(title: title, message: error)
        }
        return view
    }()
    
    let viewModel = EditProfileStepOneViewModel()
    
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
        let name = viewEditProfileStepOne.textName.text ?? ""
        let phone = viewEditProfileStepOne.textTelephone.text ?? ""
        let cpf = viewEditProfileStepOne.textCPF.text ?? ""
        let typeOfActivity = viewEditProfileStepOne.textTypeOfActivity.text ?? ""
        let birthdate = viewEditProfileStepOne.textDateBirth.text ?? ""
        
        if !viewModel.validateCPF(cpf) {
            showMessageError(title: "Error", message: "CPF inválido")
            return
        }
        
        let coodinator = Coordinator(navigationController: navigationController)
        coodinator.startEditProfileStepTwo(name: name, phone: phone, cpf: cpf, typeOfActivity: typeOfActivity, birthdate: birthdate)
    }
    
    func showMessageError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonAction = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(buttonAction)
        self.present(alert, animated: true)
    }
}
