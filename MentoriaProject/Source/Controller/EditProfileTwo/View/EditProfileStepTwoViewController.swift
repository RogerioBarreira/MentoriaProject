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
        view.onTapButtonSearch = { [weak self] in
            guard let self = self else { return }
            self.setupRequest()
        }
        view.onError = { [weak self] title, error in
            guard let self = self else { return }
            self.showMessageError(title: title, message: error)
        }
        return view
    }()
    
    let viewModel = EditProfileStepTwoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Etapa 2 de 2"
        viewEditProfileTwo.setupTextField(delegate: self)
        setupNavigationItem()
        setupActions()
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
    
    func setupActions() {
        viewEditProfileTwo.buttonConfirm.addTarget(self, action: #selector(tapButtonConfirm), for: .touchUpInside)
    }
    
    @objc
    private func tapButtonConfirm() {
        setupRequestProfile()
        if let vc = self.navigationController?.viewControllers.first(where: { $0 is ProfileViewController }) {
            self.navigationController?.popToViewController(vc, animated: true)
        } else {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    private func setupRequest() {
        let cep = viewEditProfileTwo.textCep.text ?? ""
        viewModel.getCepAddress(cep: cep) { success in
            if success {
                self.setupUI()
            } else {
                self.showMessageError(title: "Erro", message: "Erro ao Buscar o Cep")
            }
        }
    }
    
    func setupUI() {
        viewEditProfileTwo.textRoad.text = viewModel.myAddress
        viewEditProfileTwo.textNeighborhood.text = viewModel.myBairro
        viewEditProfileTwo.textCity.text = viewModel.myCity
        viewEditProfileTwo.textState.text = viewModel.myState
    }
    
    private func setupRequestProfile() {
        let name = viewModel.name ?? ""
        let image = ""
        let phone = viewModel.phone ?? ""
        let cpf = viewModel.cpf ?? ""
        let typeOfActivity = viewModel.typeOfActivity ?? ""
        let birthdate = viewModel.birthdate ?? ""
        let cep = viewEditProfileTwo.textCep.text ?? ""
        let street = viewEditProfileTwo.textRoad.text ?? ""
        let number = viewEditProfileTwo.textNumber.text ?? ""
        let district = viewEditProfileTwo.textNeighborhood.text ?? ""
        let city = viewEditProfileTwo.textCity.text ?? ""
        let state = viewEditProfileTwo.textState.text ?? ""
        let id = 3
        let isInativo = false
        let creationDate = "08/10/2023"
        let changeDate = "08/10/2023"
        let uid = ""
        //let uid = "2023-10-02617893b7-2bb3-48cb-a0f0-f623d6d8a557"
        let uidFirebase = "CodandoComMoa"
        let isChanged = true
        
        viewModel.requestProfile(name: name, image: image, phone: phone, cpf: cpf, typeOfActivity: typeOfActivity, birthdate: birthdate, cep: cep, street: street, number: number, district: district, city: city, state: state, id: id, isInativo: isInativo, creationDate: creationDate, changeDate: changeDate, uid: uid, uidFirebase: uidFirebase, isChanged: isChanged) { success in
            if success {
                DispatchQueue.main.sync {
                    self.showMessageError(title: "Successo ✅", message: "Perfil Criado Com Successo")
                }
            } else {
                DispatchQueue.main.sync {
                    self.showMessageError(title: "Falha 😭", message: "Erro ao criar Perfil")
                }
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

extension EditProfileStepTwoViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == viewEditProfileTwo.textCep {
            let allowedCharacterSet = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            guard allowedCharacterSet.isSuperset(of: characterSet) else {
                return false
            }
            let currentText = viewEditProfileTwo.textCep.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return newText.count <= 8
        }
        return true
    }
}
