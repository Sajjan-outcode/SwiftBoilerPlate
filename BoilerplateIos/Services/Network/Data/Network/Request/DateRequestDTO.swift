//
//  SummaryDayRequestDTO.swift
//  TimeEntry
//
//  Created by outcode  on 19/03/2024.
//

import Foundation

public struct DateRequestDTO: Encodable {
    
     let year: String
     let month : String
     let day: String
    
    init(year: String, month: String, day: String) {
        self.year = year
        self.month = month
        self.day = day
    }
    
}

extension DateRequestDTO {
    func toRequestDTO() -> DateRequestDTO {
        DateRequestDTO(year: self.year, month: self.month, day: self.day)
    }
}
