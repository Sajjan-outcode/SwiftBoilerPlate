//
//  LaboutFunctionResponseDTO.swift
//  TimeEntry
//
//  Created by outcode  on 14/03/2024.
//

import Foundation

    struct LabourFunctionElement: Codable {
        let code, description, timeCode: String
        let additionalPay: Double
        let allowOvertime, allowWorkOrderOrJob, driverRequired: Bool
        let driverDescription, driverPrompt: String
        let entryCodes: [String]
        let distributionCodes: [String]
        let companyCodes: [CompanyCode]
        let stateRequired: Bool
        let assignToOptions: [AssignToOption]
        let listDriverAccounts: [ListDriverAccount]
    }

    // MARK: - AssignToOption
    struct AssignToOption: Codable {
        let type: String
        let code, description, company: String
    }


    // MARK: - CompanyCode
    struct CompanyCode: Codable {
        
        let companyCode, glNumber, glSub, budgetCode: String
    }


    // MARK: - ListDriverAccount
    struct ListDriverAccount: Codable {
        let id, accountNumber, accountSub, firstName: String
        let lastName, disconnectCode: String
    }

    typealias LabourFunctionResponseDTO = [LabourFunctionElement]
 

extension LabourFunctionElement {
    func toDomain() -> LabourFunctionInfo {
        return .init(description: description, timeCode: timeCode, code: code, additionalPay: additionalPay, allowOvertime: allowOvertime, allowWorkOrderOrJob: allowWorkOrderOrJob, driverRequired: driverRequired, driverDescription: driverDescription, driverPrompt: driverPrompt, entryCodes: entryCodes, distributionCodes: distributionCodes, listDriverAccounts: toDriverList(), companyCodes: toCompanyCode(), stateRequired: stateRequired, assignToOptions: toAssignList())
    }
    
    func toDriverList() -> [ListDriverAccounts] {
        return listDriverAccounts.map { $0.toList() }
    }
    
    func toCompanyCode() -> [CompanyInformation] {
        return companyCodes.map { $0.tocompanyList() }
    }
    
    func toAssignList() -> [AssignTo] {
        return assignToOptions.map { $0.toList() }
    }
}

extension CompanyCode {
    func tocompanyList() -> CompanyInformation {
        return CompanyInformation(companyCode: self.companyCode, glNumber: self.glNumber, glSub: self.glSub, budgetCode: self.budgetCode)
    }
}

extension AssignToOption {
    func toList() -> AssignTo {
        return AssignTo(type: self.type, code: self.code, description: self.description, company: self.company)
    }
}

extension LabourFunctionResponseDTO {
    
    func toDomain() -> [LabourFunctionInfo] {
        return self.map{$0.toDomain()}
    }
}

extension ListDriverAccount {
    func toList()-> ListDriverAccounts {
        return ListDriverAccounts(id: self.id, accountSub: self.accountSub, firstName: self.firstName, lastName: self.lastName, disconnectCode: self.disconnectCode, accountNumber: self.accountNumber)
    }
}
 
