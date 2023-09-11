//
//  RegisterViewModel.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import Foundation

class RegisterViewModel {
    
    private let model: UserModel
    
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
        
        manager.register(email: user, password: password) { userModel in
            completion(.success(LoginViewModel(model: userModel)))
        } completionFailure: { error in
            completion(.failure(error))
        }
    }
}
