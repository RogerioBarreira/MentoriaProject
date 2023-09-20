//
//  LoginViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var viewLogin: LoginView = {
        let view = LoginView()
        view.onLogin = { [weak self] email, password in
            self?.setupRequest(email, password)
        }
        view.onRegister = { [weak self] in
            self?.nextRegister()
        }
        view.onSWTap = { [weak self] tap in
            guard let self = self else { return }
            self.saveEmail(_sender: tap)
        }
        view.onError = { [weak self] title, error in
            guard let self = self else { return }
            self.showMessageError(title: title, message: error)
        }
        return view
    }()
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Entrada"
        self.viewLogin.setupTextField(delegate: self)
    }
    
    override func loadView() {
        self.view = viewLogin
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationItem()
        viewFormat()
    }
    
    func setupNavigationItem() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
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
    
    func setupRequest(_ email: String, _ password: String) {
        viewLogin.loading.startAnimating()
        viewModel.getUserFromApi(user: email, password: password) { [weak self] result in
            guard let self = self else { return }
            self.viewLogin.loading.stopAnimating()
            switch result {
            case .success(_):
                if viewLogin.swPassword.isOn {
                    self.viewModel.saveEmail = true
                    self.viewModel.defaults.set(email, forKey: "savedEmail")
                }
                self.nextHome()
            case .failure(let failure):
                self.showMessageError(title: "Erro", message: failure.localizedDescription)
                self.viewModel.saveEmail = false
                self.viewModel.defaults.removeObject(forKey: "savedEmail")
            }
        }
    }
    
    func saveEmail(_sender: Bool) {
        if viewLogin.swPassword.isOn {
            if let email = viewLogin.textEmail.text {
                viewModel.saveEmail = true
                viewModel.defaults.set(email, forKey: "savedEmail")
            }
        } else {
            viewModel.saveEmail = false
            viewModel.defaults.removeObject(forKey: "savedEmail")
        }
    }
    
    func viewFormat() {
        if viewModel.saveEmail {
            if let savedEmail = viewModel.defaults.string(forKey: "savedEmail") {
                viewLogin.textEmail.text = savedEmail
            }
        }
    }
    
    private func showMessageError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .destructive)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    private func nextHome() {
        let coordinator = Coordinator(navigationController: navigationController)
        coordinator.startHome()
    }
    
    private func nextRegister() {
        let coordinator = Coordinator(navigationController: navigationController)
        coordinator.startRegister()
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == viewLogin.textEmail {
            let maxLength = 25
            let currentText = viewLogin.textEmail.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return newText.count <= maxLength
        } else if textField == viewLogin.textPassword {
            let maxLength = 25
            let currentText = viewLogin.textPassword.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return newText.count <= maxLength
        }
        return true
    }
}
