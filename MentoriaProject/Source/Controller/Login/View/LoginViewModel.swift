//
//  LoginViewModel.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import Foundation

class LoginViewModel {
    
    private let model: UserModel
    var defaults: UserDefaults = UserDefaults.standard
    
    init(model: UserModel) {
        self.model = model
    }
    
    init() {
        self.model = UserModel()
    }
    
    var email: String {
        model.email
    }
    
    func getUserFromApi(user: String,
                        password: String,
                        completion: @escaping (Result<LoginViewModel, Error>)-> Void) {
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: user, password: password) { userModel in
            completion(.success(LoginViewModel(model: userModel)))
        } completionFailure: { error in
            completion(.failure(error))
        }
    }
    
    var saveEmail: Bool {
        get {
            return defaults.bool(forKey: "saveEmail")
        }
        set {
            defaults.set(newValue, forKey: "saveEmail")
        }
    }
    
    public func isValidEmail(email: String) -> Bool {
        let regex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: email)
    }
    
//    public func isValidPassword(password: String) -> Bool {
//        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9\\W]).+$"
//        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
//        return passwordPredicate.evaluate(with: password)
//    }
    
    public func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[\\W]).+$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }

}
