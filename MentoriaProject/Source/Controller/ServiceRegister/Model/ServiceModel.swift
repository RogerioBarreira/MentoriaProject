//
//  ServiceModel.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 26/10/23.
//

import Foundation

// MARK: - ServiceModel
struct ServiceModel: Codable {
    var name, description: String
    var duration, howMutch: Int
    var id: Int?
    var isInativo: Bool
    var creationDate, changeDate, uid, uidFirebase: String
    var isChanged: Bool
    
//    init() {
//        self.name = String()
//        self.description = String()
//        self.duration = Int()
//        self.howMutch = Int()
//        self.id = Int()
//        self.isInativo = false
//        self.creationDate = String()
//        self.changeDate = String()
//        self.uid = String()
//        self.uidFirebase = String()
//        self.isChanged = false
//    }
    
    init(name: String, description: String, duration: Int, howMutch: Int, id: Int? = nil, isInativo: Bool, creationDate: String, changeDate: String, uid: String, uidFirebase: String, isChanged: Bool) {
        self.name = name
        self.description = description
        self.duration = duration
        self.howMutch = howMutch
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
        case description = "Description"
        case duration = "Duration"
        case howMutch = "HowMutch"
        case id = "Id"
        case isInativo = "IsInativo"
        case creationDate = "CreationDate"
        case changeDate = "ChangeDate"
        case uid = "Uid"
        case uidFirebase = "UidFirebase"
        case isChanged = "IsChanged"
    }
}

