//
//  LabourFuntion.swift
//  TimeEntry
//
//  Created by outcode  on 14/03/2024.
//

import Foundation


public struct LabourFunctionInfo: Codable {
    
    
    let description: String
    let code: String
    let timeCode: String
    let additionalPay: Double
    let allowOvertime: Bool
    let allowWorkOrderOrJob: Bool
    let driverRequired: Bool
    let driverDescription: String
    let driverPrompt: String
    let entryCodes:[String]
    let distributionCodes:[String]
    let listDriverAccounts:[ListDriverAccounts]
    let companyCodes:[CompanyInformation]
    let stateRequired: Bool
    let assignToOptions:[AssignTo]
    
    init(description: String, timeCode: String, code:String , additionalPay: Double, allowOvertime: Bool, allowWorkOrderOrJob: Bool, driverRequired: Bool, driverDescription: String, driverPrompt: String, entryCodes: [String], distributionCodes: [String], listDriverAccounts: [ListDriverAccounts], companyCodes: [CompanyInformation], stateRequired: Bool, assignToOptions: [AssignTo]) {
        self.description = description
        self.timeCode = timeCode
        self.additionalPay = additionalPay
        self.allowOvertime = allowOvertime
        self.allowWorkOrderOrJob = allowWorkOrderOrJob
        self.driverRequired = driverRequired
        self.driverDescription = driverDescription
        self.driverPrompt = driverPrompt
        self.entryCodes = entryCodes
        self.distributionCodes = distributionCodes
        self.listDriverAccounts = listDriverAccounts
        self.companyCodes = companyCodes
        self.stateRequired = stateRequired
        self.assignToOptions = assignToOptions
        self.code = code
    }
    
  
}

struct ListDriverAccounts: Codable {
    
    var id:String
    var accountSub:String
    var firstName:String
    var lastName:String
    var disconnectCode: String
    var accountNumber: String
    
    init(id: String, accountSub: String, firstName: String, lastName: String, disconnectCode: String, accountNumber: String) {
        self.id = id
        self.accountSub = accountSub
        self.firstName = firstName
        self.lastName = lastName
        self.disconnectCode = disconnectCode
        self.accountNumber = accountNumber
    }
    
}


struct CompanyInformation: Codable {
    
    var companyCode:String
    var glNumber:String
    var glSub:String
    var budgetCode:String
    
    init(companyCode: String, glNumber: String, glSub: String, budgetCode: String) {
        self.companyCode = companyCode
        self.glNumber = glNumber
        self.glSub = glSub
        self.budgetCode = budgetCode
    }
    
}

struct AssignTo: Codable {
    var type:String
    var code:String
    var description:String
    var company: String
    
    init(type: String, code: String, description: String, company: String) {
        self.type = type
        self.code = code
        self.description = description
        self.company = company
    }
}


