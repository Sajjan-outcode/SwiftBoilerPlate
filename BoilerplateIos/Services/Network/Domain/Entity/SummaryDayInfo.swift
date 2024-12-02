//
//  SummaryDayInfo.swift
//  TimeEntry
//
//  Created by outcode  on 18/03/2024.
//

import Foundation

public struct SummaryDayInfo : Identifiable,Codable {
    
    public var id = UUID()
    let date: String
    let regularHoursTotal: Double
    let overTimeHoursTotal: Double
    let partialApproved: Bool
    let approved: Bool
    let commission: Double

    init(id: UUID = UUID(), date: String, regularHoursTotal: Double, overTimeHoursTotal: Double, partialApproved: Bool, approved: Bool, commission: Double) {
        self.id = id
        self.date = date
        self.regularHoursTotal = regularHoursTotal
        self.overTimeHoursTotal = overTimeHoursTotal
        self.partialApproved = partialApproved
        self.approved = approved
        self.commission = commission
    }
    
}

