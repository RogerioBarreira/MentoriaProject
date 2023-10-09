//
//  EditProfileStepTwoViewModel.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 09/10/23.
//

import Foundation
import SDKNET

class EditProfileStepTwoViewModel {
    
    private let provider = Provider()
    private var myProfile: CreateProfile?
    private var myCep: CepModel?
    
    var myAddress: String {
        myCep?.logradouro ?? ""
    }
    
    var myBairro: String {
        myCep?.bairro ?? ""
    }
    
    var myCity: String {
        myCep?.localidade ?? ""
    }
    
    var myState: String {
        myCep?.uf ?? ""
    }
    
    func getCepAddress(cep: String, completion: @escaping (Bool) -> Void) {
        let url = "https://viacep.com.br/ws/\(cep)/json/"
        
        provider.requestProvider(urlString: url, method: .get, expecting: CepModel.self) { result in
            switch result {
            case .success(let cep):
                self.myCep = cep
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
    
    func requestProfile(name: String, image: String, phone: String, cpf: String, typeOfActivity: String, birthdate: String, cep: String, street: String, number: String, district: String, city: String, state: String, id: Int, isInativo: Bool, creationDate: String, changeDate: String, uid: String, uidFirebase: String, isChanged: Bool, completion: @escaping (Bool)-> Void) {
        
        let profile = CreateProfile(name: name, image: image, phone: phone, cpf: cpf, typeOfActivity: typeOfActivity, birthdate: birthdate, cep: cep, street: street, number: number, district: district, city: city, state: state, id: id, isInativo: isInativo, creationDate: creationDate, changeDate: changeDate, uid: uid, uidFirebase: uidFirebase, isChanged: isChanged)
        
        guard let apiUrl = URL(string: "http://mentoria.codandocommoa.com.br/Api/Profile/PostProfile") else { return }
        
        let encoder = JSONEncoder()
        let jsonData = try? encoder.encode(profile)
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            if let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) {
                completion(true)
                print("Successfully created profile!")
            } else {
                completion(false)
                print("Unexpected response: \(response.debugDescription)")
            }
        }
        task.resume()
    }
}
