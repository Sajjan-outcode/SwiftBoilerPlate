//
//  LoginInfo.swift
//  TimeEntry
//
//  Created by outcode  on 22/02/2024.
//

import Foundation

public struct LogInInfo: Equatable {
    
    public let userName:String
    public let password:String
    public let companyNumber:String
    public let year:String
    public let library:String
    public let uuid:String

    public init(userName: String,
                password: String,companyNumber: String,year: String, library:String, uuid: String ) {
     
        self.userName = userName
        self.password = password
        self.companyNumber = companyNumber
        self.year = year
        self.library = library
        self.uuid = uuid
    }
}

extension LogInInfo {
    func toRequestDTO() -> LoginRequestDTO {
        LoginRequestDTO(username: self.userName, password: self.password, companyNumber: self.companyNumber, year: self.year, library: self.library, uuid: self.uuid)
    }
}
