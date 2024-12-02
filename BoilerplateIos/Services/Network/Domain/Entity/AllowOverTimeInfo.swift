//
//  AllowOverTimeInfo.swift
//  TimeEntry
//
//  Created by outcode  on 15/03/2024.
//

import Foundation

public struct AllowOverTimeInfo: Codable {
    
    let response: Bool
    
    init(response: Bool) {
        self.response = response
   }
    
}
