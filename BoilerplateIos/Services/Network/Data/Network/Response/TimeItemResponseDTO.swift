//
//  TimeItemResponseDTO.swift
//  TimeEntry
//
//  Created by outcode  on 01/04/2024.
//

import Foundation

struct TimeItem: Codable {
    
    let rrn: Int
    let employeeNumber, date: String
    let regularHours, overTimeHours: Double
    let laborFunction: LabourFunctionInfo
    let driverQuantity: Double
    let statePaidIn: StatePaidInInfo
    let assignTo: AssignTo
    let workOrder: WorkOrderInfo
    let closeGL: CloseGLInfo
    let truck: TruckInfo
    let truckHours: Double
    let notes: String
    let approved: Bool
    let commission: Double
    let driverAccount: ListDriverAccounts
    
}
typealias TimeItemResponseDTO = [TimeItem]

extension TimeItem {
    func toDomain() -> TimeItemInfo {
        return .init(rrn: rrn, employeeNumber: employeeNumber,
                     date: date, regularHours: regularHours, overTimeHours: overTimeHours, laborFunction: laborFunction, driverQuantity: driverQuantity, statePaidIn: statePaidIn, assignTo: assignTo, workOrder: workOrder, closeGL: closeGL, truck: truck, truckHours: truckHours, notes: notes, approved: approved, commission: commission, driverAccount: driverAccount)
        
    }
}


extension TimeItemResponseDTO {
    
    func toDomain() -> [TimeItemInfo] {
        return self.map{$0.toDomain()}
    }
}

