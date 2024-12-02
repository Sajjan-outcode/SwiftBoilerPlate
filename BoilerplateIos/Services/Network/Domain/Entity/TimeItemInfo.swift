//
//  TimeItemInfo.swift
//  TimeEntry
//
//  Created by outcode  on 01/04/2024.
//


import Foundation

public struct TimeItemInfo: Identifiable, Codable {
    
    public var id = UUID()
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
    
    init(rrn: Int, employeeNumber: String, date: String, regularHours: Double, overTimeHours: Double, laborFunction: LabourFunctionInfo, driverQuantity: Double, statePaidIn: StatePaidInInfo, assignTo: AssignTo, workOrder: WorkOrderInfo, closeGL: CloseGLInfo, truck: TruckInfo, truckHours: Double, notes: String, approved: Bool, commission: Double, driverAccount: ListDriverAccounts) {
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



// MARK: - CloseGL
struct CloseGL: Codable {
    let number, glExtension, description: String
    
}

// MARK: - DriverAccount
struct DriverAccount: Codable {
    let id, accountNumber, accountSub, firstName: String
    let lastName, disconnectCode: String
    
}


// MARK: - WorkOrder
struct WorkOrder: Codable {
    let number, description: String
    let closeGLOptions: [CloseGLInfo]
    let companyCode: String
}
typealias WorkOrderResponseDTO = [WorkOrder]


extension CloseGL {
    func toDomain() -> CloseGL {
        return CloseGL(number: self.number, glExtension: self.glExtension, description: self.description)
    }
}

extension DriverAccount {
    func toDomain() -> DriverAccount {
        return DriverAccount(id: self.id, accountNumber: self.accountNumber, accountSub: self.accountSub, firstName: self.firstName, lastName: self.lastName, disconnectCode: self.disconnectCode)
    }
}

extension WorkOrder {
    func toDomain() -> WorkOrderInfo {
        return WorkOrderInfo(number: self.number, description: self.description, closeGLOptions: self.closeGLOptions, companyCode: self.companyCode)
    }
}

extension WorkOrderResponseDTO {
    
    func toDomain() -> [WorkOrderInfo] {
        return self.map{$0.toDomain()}
    }
}

