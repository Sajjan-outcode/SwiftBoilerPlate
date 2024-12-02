//
//  TruckResponseDTO.swift
//  TimeEntry
//
//  Created by outcode  on 15/03/2024.
//

import Foundation

struct Truck: Codable {
    
    let number, description: String
    
}

typealias TruckResponseDTO = [Truck]

extension Truck {
    func toDomain() -> TruckInfo {
        return .init(number: number, description: description)
    }
}

extension TruckResponseDTO {
    func toDomain() -> [TruckInfo] {
        return self.map{$0.toDomain()}
    }
}
