//
//  TruckInfo.swift
//  TimeEntry
//
//  Created by outcode  on 15/03/2024.
//

import Foundation

public struct TruckInfo: Codable {
    
    let number: String
    let description: String
  
    init(number: String, description: String) {
        self.description = description
        self.number = number
    }
    
}
