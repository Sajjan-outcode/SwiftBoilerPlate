//
//  StatePaidInResponseDTO.swift
//  TimeEntry
//
//  Created by outcode  on 15/03/2024.
//

import Foundation

// MARK: - LabourFunctionElement
struct StatePaidIn: Codable {
    let code, state, description, glExtension: String
}

typealias StatePaidInResponseDTO = [StatePaidIn]

extension StatePaidIn {
    func toDomain() -> StatePaidInInfo {
        return .init(code: code, state: state, description: description, glExtension: glExtension)
    }
}
extension StatePaidInResponseDTO {
    
    func toDomain() -> [StatePaidInInfo] {
        return self.map{$0.toDomain()}
    }
}
