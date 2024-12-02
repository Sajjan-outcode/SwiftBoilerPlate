//
//  SummarInfoDTO.swift
//  TimeEntry
//
//  Created by outcode  on 18/03/2024.
//

import Foundation

struct SummaryDay: Codable {
    
    let date: String
    let regularHoursTotal: Double
    let overTimeHoursTotal: Double
    let partialApproved: Bool
    let approved: Bool
    let commission: Double
    
}
    typealias SummaryDayInfoDTO = [SummaryDay]
    
extension SummaryDay {
    
    func toDomain() -> SummaryDayInfo {
        return .init(date: date,
                     regularHoursTotal: regularHoursTotal,
                     overTimeHoursTotal: overTimeHoursTotal,
                     partialApproved: partialApproved,
                     approved: approved,
                     commission: commission)
    }
    
}

extension SummaryDayInfoDTO {
    func toDomain() -> [SummaryDayInfo] {
        return self.map{$0.toDomain()}
    }
}
