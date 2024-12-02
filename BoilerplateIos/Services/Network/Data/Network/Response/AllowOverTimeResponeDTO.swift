//
//  AllowOverTimeResponeDTO.swift
//  TimeEntry
//
//  Created by outcode  on 15/03/2024.
//

import Foundation


struct AllowOvertime: Codable {
    
    let response : Bool

}

typealias AllowOverTimeResponeDTO = AllowOvertime

extension AllowOverTimeResponeDTO {
    func toDomain() -> AllowOverTimeInfo {
        return .init(response: response)
    }
    
    
}
