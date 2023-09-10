//
//  UserBusiness.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 09/09/23.
//

import Foundation

protocol UserBusinessProtocol {
    func register(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
    func login(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
}

class UserBusiness: UserBusinessProtocol {
    let provider: UserProvider = UserProvider()
    
    func register(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        
        provider.register(parameters: getParameters(email, password)) { result in
            switch result {
            case .success(let userModel):
                completion(.success(userModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        
        provider.login(parameters: getParameters(email, password)) { result in
            switch result {
            case .success(let userModel):
                completion(.success(userModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func getParameters(_ email: String, _ password: String) -> [AnyHashable: Any] {
        let userModel: UserModel = UserModel(email: email, password: password)
        let param: [AnyHashable: Any] = [Constants.ParametersKeys.body: [Constants.ParametersKeys.userModel:userModel]]
        return param
    }
}
