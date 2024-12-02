//
//  AuthenticationEndPoint.swift
//  TimeEntry
//
//  Created by outcode  on 22/02/2024.
//

import Foundation

struct AuthenticationEndpoint {
    
    static func authenticateUser(requestDTO: LoginRequestDTO) -> Endpoint<LoginResponseDTO> {
      
        return Endpoint(path: "api/Token",
                        method: .post,
                        bodyParamatersEncodable: requestDTO,
                        bodyEncoding: JSONEncoding.default
        )
    }
    
    static func companyInfo(companyKey: String) -> Endpoint<CompanyInfoResponseDTO> {
        
        return Endpoint(path: "api/keys/\(companyKey)",
                        method: .get)
        
    }
    
}

