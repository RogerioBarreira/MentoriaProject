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
        return view
    }()
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        buttonImageTap()
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
    
    private func buttonImageTap() {
        viewProfile.buttonImagePhoto.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }
    
    @objc
    private func buttonTap() {
       if self.imagePicker.sourceType == .photoLibrary {
            self.viewProfile.imageIconPhoto.isHidden = true
            self.present(self.imagePicker, animated: true)
        }
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
