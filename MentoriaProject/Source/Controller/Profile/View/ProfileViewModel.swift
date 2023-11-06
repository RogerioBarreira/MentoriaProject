//
//  ProfileViewModel.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 09/10/23.
//

import Foundation

class ProfileViewModel {
    
    private let worker = Worker()
    var myProfile: ProfileID?
    var id = 3
    
    var idFirebase: String?
    
    var idFire: String {
        return idFirebase ?? ""
    }
    
    var uid: String {
        myProfile?.result?.uid ?? ""
    }
    
    var myName: String {
        get { myProfile?.result?.name ?? "" }
        set { myProfile?.result?.name = newValue }
    }
    
    var myImage: String {
        get { myProfile?.result?.image ?? "" }
        set { myProfile?.result?.image = newValue }
    }
    
    var myPhone: String {
        get { myProfile?.result?.phone ?? "" }
        set { myProfile?.result?.phone = newValue }
    }
    
    var myCpf: String {
        get { myProfile?.result?.cpf ?? "" }
        set { myProfile?.result?.cpf = newValue }
    }
    
    var myTypeOfActivity: String {
        get { myProfile?.result?.typeOfActivity ?? "" }
        set { myProfile?.result?.typeOfActivity = newValue }
    }
    
    var myBirthdate: String {
        get { myProfile?.result?.birthdate ?? "" }
        set { myProfile?.result?.birthdate = newValue }
    }
    
    var myCep: String {
        get { myProfile?.result?.cep ?? "" }
        set { myProfile?.result?.cep = newValue }
    }
    
    var myStreet: String {
        get { myProfile?.result?.street ?? "" }
        set { myProfile?.result?.street = newValue }
    }
    
    var myNumber: String {
        get { myProfile?.result?.number ?? "" }
        set { myProfile?.result?.number = newValue }
    }
    
    var myDistrict: String {
        get { myProfile?.result?.district ?? "" }
        set { myProfile?.result?.district = newValue }
    }
    
    var myCity: String {
        get { myProfile?.result?.city ?? "" }
        set { myProfile?.result?.city = newValue }
    }
    
    var myState: String {
        get { myProfile?.result?.state ?? "" }
        set { myProfile?.result?.state = newValue }
    }
    
    var myId: Int {
        get { myProfile?.result?.id ?? 0 }
        set { myProfile?.result?.id = newValue }
    }
    
    var myIsInativo: Bool {
        get { myProfile?.result?.isInativo ?? false }
        set { myProfile?.result?.isInativo = newValue }
    }
    
    var myCreationDate: String {
        get { myProfile?.result?.creationDate ?? "" }
        set { myProfile?.result?.creationDate = newValue }
    }
    
    var myChangeDate: String {
        get { myProfile?.result?.changeDate ?? "" }
        set { myProfile?.result?.changeDate = newValue }
    }
    
    var myUid: String {
        get { myProfile?.result?.uid ?? "" }
        set { myProfile?.result?.uid = newValue }
    }
    
    var myUidFirebase: String {
        get { myProfile?.result?.uidFirebase ?? "" }
        set { myProfile?.result?.uidFirebase = newValue }
    }
    
    var myIsChanged: Bool {
        get { myProfile?.result?.isChanged ?? true }
        set { myProfile?.result?.isChanged = newValue }
    }
    
    func getIdProfile(uidFirebae: String?) {
        self.idFirebase = uidFirebae
    }
    
    func saveProfileLocally() {
        let profileData: [String: Any] = [
            "name": myName,
            "phone": myPhone,
            "cpf": myCpf,
            "typeOfActivity": myTypeOfActivity,
            "birthdate": myBirthdate,
            "cep": myCep,
            "street": myStreet,
            "number": myNumber,
            "district": myDistrict,
            "city": myCity,
            "state": myState,
            "id": myId,
            "isInativo": myIsInativo,
            "creationDate": myCreationDate,
            "changeDate": myChangeDate,
            "uid": myUid,
            "uidFirebase": myUidFirebase,
            "isChanged": myIsChanged
        ]
        UserDefaults.standard.set(profileData, forKey: "userProfile")
    }
    
    func loadProfileLocally() {
        guard let profileData = UserDefaults.standard.dictionary(forKey: "userProfile") else {
            return
        }
        
        myName = profileData["name"] as? String ?? ""
        myPhone = profileData["phone"] as? String ?? ""
        myCpf = profileData["cpf"] as? String ?? ""
        myTypeOfActivity = profileData["typeOfActivity"] as? String ?? ""
        myBirthdate = profileData["birthdate"] as? String ?? ""
        myCep = profileData["cep"] as? String ?? ""
        myStreet = profileData["street"] as? String ?? ""
        myNumber = profileData["number"] as? String ?? ""
        myDistrict = profileData["district"] as? String ?? ""
        myCity = profileData["city"] as? String ?? ""
        myState = profileData["state"] as? String ?? ""
        myId = profileData["id"] as? Int ?? 0
        myIsInativo = profileData["isInativo"] as? Bool ?? false
        myCreationDate = profileData["creationDate"] as? String ?? ""
        myChangeDate = profileData["changeDate"] as? String ?? ""
        myUid = profileData["uid"] as? String ?? ""
        myUidFirebase = profileData["uidFirebase"] as? String ?? ""
        myIsChanged = profileData["isChanged"] as? Bool ?? true
    }
    
    func getProfileId(completion: @escaping (Bool) -> Void) {
        worker.workerGetProfileId(id: id) { result in
            switch result {
            case .success(let profile):
                self.myProfile = profile
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
}
