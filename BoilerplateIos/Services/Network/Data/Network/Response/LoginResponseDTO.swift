//
//  LoginResponseDTO.swift
//  TimeEntry
//
//  Created by outcode  on 22/02/2024.
//

import Foundation


struct LoginResponseDTO: Decodable {

    let token: String
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }
    
}

extension LoginResponseDTO {
    func toDomain() -> UserAccessInfo {
        return .init(accessToken: token)
    }
}
