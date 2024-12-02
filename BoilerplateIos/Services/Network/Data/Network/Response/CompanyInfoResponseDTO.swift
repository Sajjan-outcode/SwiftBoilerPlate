//
//  CompanyInfoResponseDTO.swift
//  TimeEntry
//
//  Created by outcode  on 22/02/2024.
//

import Foundation

struct CompanyInfoResponseDTO: Decodable {

     let name:String
     let api:String
     let logo:String
     let logoNight:String
     let companyNumber:String
     let library:String
     let year: String
     let colorSchemeRed: String
     let colorSchemeGreen: String
     let colorSchemeBlue: String
    
    enum CodingKeys: String, CodingKey {
        
        case name = "Name"
        case api = "API"
        case logo = "Logo"
        case logoNight = "LogoNight"
        case companyNumber = "Company Number"
        case library = "Library"
        case year = "Year"
        case colorSchemeRed = "Color Scheme Red"
        case colorSchemeGreen = "Color Scheme Green"
        case colorSchemeBlue = "Color Scheme Blue"
        
    }
}

extension CompanyInfoResponseDTO {
    func toDomain() -> CompanyInfo {
        return .init(name: name,
                     api: api,
                     logo: logo,
                     logoNight: logoNight,
                     companyNumber: companyNumber,
                     library: library,
                     year: year,
                     colorSchemeRed: colorSchemeRed,
                     colorSchemeGreen: colorSchemeGreen,
                     colorSchemeBlue: colorSchemeBlue)
    }
}
