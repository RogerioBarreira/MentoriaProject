//
//  ServiceRegisterViewModel.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 26/10/23.
//

import Foundation

class ServiceRegisterViewModel {
    
    private let worker = Worker()
    private var serviceModel: ServiceModel?
    private var serviceDelet: ServiceDelete?
    
   
    func requestProfile(name: String, description: String, duration: Int, howMutch: Int, id: Int, isInativo: Bool, creationDate: String, changeDate: String, uid: String, uidFirebase: String, isChanged: Bool, completion: @escaping (Bool)-> Void) {
        
        let service = ServiceModel(name: name, description: description, duration: duration, howMutch: howMutch, id: id, isInativo: isInativo, creationDate: creationDate, changeDate: changeDate, uid: uid, uidFirebase: uidFirebase, isChanged: isChanged)
        
        guard let apiUrl = URL(string: "http://mentoria.codandocommoa.com.br/Api/Service/PostService") else { return }
        
        let encoder = JSONEncoder()
        let jsonData = try? encoder.encode(service)
        
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
