//
//  LoginRequestDTO.swift
//  TimeEntry
//
//  Created by outcode  on 22/02/2024.
//

import Foundation

struct LoginRequestDTO: Encodable {
    
    private let username: String
    private let password: String
    private let companyNumber:String
    private let year:String
    private let library:String
    private let uuid:String
    
    
    enum CodingKeys: String, CodingKey {
        case username = "Username"
        case password = "Password"
        case companyNumber = "CompanyNumber"
        case year = "Year"
        case library = "Library"
        case uuid = "UUID"
    }
    
    init(username: String, password: String, companyNumber: String, year: String, library: String, uuid: String) {
        self.username = username
        self.password = password
        self.companyNumber = companyNumber
        self.year = year
        self.library = library
        self.uuid = uuid
    }
}
