//
//  ProfileId.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 09/10/23.
//

import Foundation

// MARK: - ProfileID
struct ProfileID: Codable {
    var result: ResultProfileId?
    var resultJSON: JSONNull?
    var isSucess: Bool?
    var message, exception, stackTrace: JSONNull?

    enum CodingKeys: String, CodingKey {
        case result = "Result"
        case resultJSON = "ResultJson"
        case isSucess = "IsSucess"
        case message = "Message"
        case exception = "Exception"
        case stackTrace = "StackTrace"
    }
}

// MARK: - ResultProfileId
struct ResultProfileId: Codable {
    var name, image, phone, cpf: String?
    var typeOfActivity, birthdate, cep, street: String?
    var number, district, city, state: String?
    var id: Int?
    var isInativo: Bool?
    var creationDate, changeDate, uid, uidFirebase: String?
    var isChanged: Bool?

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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
