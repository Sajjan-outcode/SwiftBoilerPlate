//
//  EmployeeInfo.swift
//  TimeEntry
//
//  Created by outcode  on 15/03/2024.
//

import Foundation

public struct EmployeeInfo : Codable{
    
    let userName: String
    let library: String
    let companyNumber: String
    let year: String
    let employeeNumber: String
    let nameOfUser: String
   
    init(userName: String, library: String, companyNumber: String, year: String, employeeNumber: String, nameOfUser: String) {
        self.userName = userName
        self.library = library
        self.companyNumber = companyNumber
        self.year = year
        self.employeeNumber = employeeNumber
        self.nameOfUser = nameOfUser
    }
    
}
