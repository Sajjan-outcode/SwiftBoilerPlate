//
//  StatePaidin.swift
//  TimeEntry
//
//  Created by outcode  on 15/03/2024.
//

import Foundation

public struct StatePaidInInfo: Codable {
    
    let code: String
    let state: String
    let description: String
    let glExtension: String
    
    init(code: String, state: String, description: String, glExtension: String) {
        self.code = code
        self.state = state
        self.description = description
        self.glExtension = glExtension
    }
    
}
