//
//  HomeTabbarViewModel.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 28/10/23.
//

import Foundation

class HomeTabbarViewModel {
    
    var idFirebase: String?
    
    var name: String {
        return idFirebase ?? ""
    }
    
    func getIdFirebas(idFirebase: String?) {
        self.idFirebase = idFirebase
    }
}
