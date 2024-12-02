//
//  UserRepository.swift
//  TimeEntry
//
//  Created by outcode  on 14/03/2024.
//

import Foundation

public protocol CompanyRepository {
   
    @discardableResult
    func getLabourFunction(completion: @escaping((Result<[LabourFunctionInfo], Error>)-> Void)) -> Resumable?
 
    @discardableResult
    func getStatePaidInfo(completion: @escaping((Result<[StatePaidInInfo], Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func getTruckInfo(completion: @escaping((Result<[TruckInfo], Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func getAllowOverTimeInfo(completion: @escaping((Result<AllowOverTimeInfo, Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func getEmployeeInfo(completion: @escaping((Result<EmployeeInfo, Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func getWorkOrderInfo(with statePaidInCode: String,completion: @escaping((Result<[WorkOrderInfo], Error>)-> Void)) -> Resumable?
}

