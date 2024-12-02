//
//  EncodeToJSON.swift
//  TimeEntry
//
//  Created by outcode  on 07/06/2024.
//

import Foundation

public extension JSONEncoder {
    
    static func encodeToJSON<T: Encodable>(_ value: T) -> String? {
        do {
            let jsonData = try JSONEncoder().encode(value)
            
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print("Failed to encode to JSON: \(error)")
            return nil
        }
    }
}
