//
//  ProfileViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 10/09/23.
//

import Foundation
import UIKit
import Photos

class ProfileViewController: UIViewController {
    
    lazy var viewProfile: ProfileView = {
        let view = ProfileView()
        view.onTapEditProfile = { [weak self] in
            guard let self = self else { return }
            self.nextEditProfileStepOne()
        }
        view.onTapButtonPerfil = { [weak self] in
            guard let self = self else { return }
            self.buttonTap()
        }
        return view
    }()
    
    let viewModel = ProfileViewModel()
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        viewModel.saveProfileLocally()
        viewModel.loadProfileLocally()
        
        if viewModel.myName.isEmpty {
            setupRequest()
        } else {
            setupUI()
        }
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
    
    func setupRequest() {
        viewModel.getProfileId { [weak self] success in
            guard let self = self else { return }
            if success {
                self.viewModel.saveProfileLocally()
                self.setupUI()
            } else {
                self.showMessageError(title: "Erro", message: "Erro ao Buscar o Perfil")
            }
        }
    }
    
    private func setupUI() {
        viewProfile.labelName.text = viewModel.myName
        viewProfile.labelFuncDescription.text = viewModel.myTypeOfActivity
        viewProfile.labelCPFDescription.text = viewModel.myCpf
        viewProfile.labelDateBirthDescription.text = viewModel.myBirthdate
        viewProfile.labelPhoneDescription.text = viewModel.myPhone
        viewProfile.labelAddressDescription.text = viewModel.myStreet
        viewProfile.labelAddressNumber.text = viewModel.myNumber
        viewProfile.labelAddressDistrict.text = viewModel.myDistrict
        viewProfile.labelAddressZipCode.text = viewModel.myCep
        viewProfile.labelAddressCity.text = viewModel.myCity
    }
    
    private func buttonTap() {
        if self.imagePicker.sourceType == .photoLibrary {
            self.viewProfile.imageIconPhoto.isHidden = true
            self.present(self.imagePicker, animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.setupRequest()
            }
        }
    }
    
    private func showMessageError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonAction = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(buttonAction)
        self.present(alert, animated: true)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagemRecuperada: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.viewProfile.backgroundImagePhoto.image = imagemRecuperada
        }
        picker.dismiss(animated: true)
    }
}
