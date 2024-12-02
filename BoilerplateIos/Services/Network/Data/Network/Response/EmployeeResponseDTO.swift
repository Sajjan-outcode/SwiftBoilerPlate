//
//  EmployeeResponseDTO.swift
//  TimeEntry
//
//  Created by outcode  on 15/03/2024.
//

import Foundation

struct EmployeeResponseDTO: Codable {
    
    let userName: String
    let library: String
    let companyNumber: String
    let year: String
    let employeeNumber: String
    let nameOfUser: String
    
}

extension EmployeeResponseDTO {
    func toDomain() -> EmployeeInfo {
        return .init(userName: userName, library: library, companyNumber: companyNumber, year: year, employeeNumber: employeeNumber, nameOfUser: nameOfUser)
    }
}
