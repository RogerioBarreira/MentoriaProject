//
//  CreateProfile.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 09/10/23.
//

import Foundation

// MARK: - CreateProfile
struct CreateProfile: Codable {
    let name, image, phone, cpf: String?
    let typeOfActivity, birthdate, cep, street: String?
    let number, district, city, state: String?
    let id: Int?
    let isInativo: Bool?
    let creationDate, changeDate, uid, uidFirebase: String?
    let isChanged: Bool?
    
    init() {
        self.name = String()
        self.image = String()
        self.phone = String()
        self.cpf = String()
        self.typeOfActivity = String()
        self.birthdate = String()
        self.cep = String()
        self.street = String()
        self.number = String()
        self.district = String()
        self.city = String()
        self.state = String()
        self.id = Int()
        self.isInativo = Bool()
        self.creationDate = String()
        self.changeDate = String()
        self.uid = String()
        self.uidFirebase = String()
        self.isChanged = Bool()
    }
    
    init(name: String,
         image:String,
         phone:String,
         cpf: String,
         typeOfActivity: String,
         birthdate: String,
         cep: String,
         street: String,
         number: String,
         district: String,
         city: String,
         state: String,
         id: Int,
         isInativo: Bool,
         creationDate: String,
         changeDate: String,
         uid:String,
         uidFirebase: String,
         isChanged: Bool
    ) {
        self.name = name
        self.image = image
        self.phone = phone
        self.cpf = cpf
        self.typeOfActivity = typeOfActivity
        self.birthdate = birthdate
        self.cep = cep
        self.street = street
        self.number = number
        self.district = district
        self.city = city
        self.state = state
        self.id = id
        self.isInativo = isInativo
        self.creationDate = creationDate
        self.changeDate = changeDate
        self.uid = uid
        self.uidFirebase = uidFirebase
        self.isChanged = isChanged
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case image = "Image"
        case phone = "Phone"
        case cpf = "Cpf"
        case typeOfActivity = "TypeOfActivity"
        case birthdate = "Birthdate"
        case cep = "Cep"
        case street = "Street"
        case number = "Number"
        case district = "District"
        case city = "City"
        case state = "State"
        case id = "Id"
        case isInativo = "IsInativo"
        case creationDate = "CreationDate"
        case changeDate = "ChangeDate"
        case uid = "Uid"
        case uidFirebase = "UidFirebase"
        case isChanged = "IsChanged"
    }
}


