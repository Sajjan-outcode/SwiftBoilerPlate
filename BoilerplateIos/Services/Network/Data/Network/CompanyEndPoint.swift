//
//  UserEndPoint.swift
//  TimeEntry
//
//  Created by outcode  on 14/03/2024.
//

import Foundation


struct CompanyEndPoint {
    
    private static var baseUrl: String {
           guard let baseUrl = UserManager.global.getCompanyInfo()?.api else {
               fatalError("Base URL is not available")
           }
           return baseUrl
       }
    static func fetchLabourFunction() -> Endpoint<LabourFunctionResponseDTO> {
        return Endpoint(path: "\(baseUrl)api/Time/GetLaborFunctions",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func fetchStatePaidIn() -> Endpoint<StatePaidInResponseDTO> {
        return Endpoint(path: "\(baseUrl)api/Time/GetStatesPaidIn",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func fetchGetTruck() -> Endpoint<TruckResponseDTO> {
        return Endpoint(path: "\(baseUrl)api/Time/GetTruckInfo",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func fetchAllowOverTime() -> Endpoint<AllowOverTimeResponeDTO> {
        return Endpoint(path: "\(baseUrl)api/Time/AllowOverTime",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func fetchEmployee() -> Endpoint<EmployeeResponseDTO> {
        return Endpoint(path: "\(baseUrl)api/Time/DisectToken",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func fetchWorkOrder(with statePaidInCode: String) -> Endpoint<WorkOrderResponseDTO> {
        return Endpoint(path: "\(baseUrl)api/Time/GetWorkOrders/\(statePaidInCode)",
                        isFullPath: true,
                        method: .get)
    }
   
}
