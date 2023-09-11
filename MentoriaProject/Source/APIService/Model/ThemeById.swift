//
//  ThemeById.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 11/09/23.
//

import Foundation

// MARK: - ThemeByID
struct ThemeByID: Codable {
    let result: ResultThemeByID?
    let resultJSON: String?
    let isSucess: Bool?
    let message: String?
    let exception: ExceptionThemeByID?
    let stackTrace: String?

    enum CodingKeys: String, CodingKey {
        case result = "Result"
        case resultJSON = "ResultJson"
        case isSucess = "IsSucess"
        case message = "Message"
        case exception = "Exception"
        case stackTrace = "StackTrace"
    }
}

// MARK: - ExceptionThemeByID
struct ExceptionThemeByID: Codable {
}

// MARK: - ResultThemeByID
struct ResultThemeByID: Codable {
    let name: String?
    let id: Int?
    let isInativo: Bool?
    let creationDate, changeDate, uid, uidFirebase: String?
    let isChanged: Bool?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case id = "Id"
        case isInativo = "IsInativo"
        case creationDate = "CreationDate"
        case changeDate = "ChangeDate"
        case uid = "Uid"
        case uidFirebase = "UidFirebase"
        case isChanged = "IsChanged"
    }
}
