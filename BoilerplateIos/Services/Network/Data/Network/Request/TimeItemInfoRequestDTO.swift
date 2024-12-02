//
//  TimeItemInfoRequestDTO.swift
//  TimeEntry
//
//  Created by outcode  on 04/06/2024.
//


import Foundation

public struct TimeItemInfoRequestDataDTO: Encodable  {
    
   
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
    let driverAccount: ListDriverAccounts?
    let truckHours: Double
    let notes: String
    let approved: Bool
    let commission: Double
  
    
    init(rrn: Int, employeeNumber: String, date: String, regularHours: Double, overTimeHours: Double, laborFunction: LabourFunctionInfo, driverQuantity: Double, statePaidIn: StatePaidInInfo, assignTo: AssignTo, workOrder: WorkOrderInfo, closeGL: CloseGLInfo , truck: TruckInfo, truckHours: Double, notes: String, approved: Bool, commission: Double, driverAccount: ListDriverAccounts ) {
        self.rrn = rrn
        self.employeeNumber = employeeNumber
        self.date = date
        self.regularHours = regularHours
        self.overTimeHours = overTimeHours
        self.laborFunction = laborFunction
        self.driverQuantity = driverQuantity
        self.statePaidIn = statePaidIn
        self.assignTo = assignTo
        self.workOrder = workOrder
        self.closeGL = closeGL
        self.truck = truck
        self.truckHours = truckHours
        self.notes = notes
        self.approved = approved
        self.commission = commission
        self.driverAccount = driverAccount
    }
}

public typealias TimeItemInfoRequestDTO = TimeItemInfoRequestDataDTO
