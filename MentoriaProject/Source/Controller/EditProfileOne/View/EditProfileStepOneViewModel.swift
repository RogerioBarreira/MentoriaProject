//
//  EditProfileStepOneViewModel.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 09/10/23.
//

import Foundation

class EditProfileStepOneViewModel {
    
    func validateCPF(_ cpf: String) -> Bool {
        let cleanedCPF = cpf.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        guard cleanedCPF.count == 11 && Set(cleanedCPF).count > 1 else {
            return false
        }
        
        let digits = cleanedCPF.compactMap { Int(String($0)) }
        
        let firstDigit = (0..<9).reversed().reduce(0) { sum, i in
            sum + digits[i] * (10 - i)
        } % 11
        let calculatedFirstDigit = (firstDigit < 2) ? 0 : 11 - firstDigit
        
        let secondDigit = (0..<10).reversed().reduce(0) { sum, i in
            sum + digits[i] * (11 - i)
        } % 11
        let calculatedSecondDigit = (secondDigit < 2) ? 0 : 11 - secondDigit
        
        return calculatedFirstDigit == digits[9] && calculatedSecondDigit == digits[10]
    }
}
