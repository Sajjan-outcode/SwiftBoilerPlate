//
//  TimeProvider.swift
//  TimeEntry
//
//  Created by outcode  on 18/03/2024.
//

import Foundation

class TimeProvider {
    
    public static var shared: TimeProvider {
        
        return singleton
    }
    
    private static let singleton: TimeProvider = TimeProvider()
    private var companyRepository: TimeRepository?
    
    
    func makeCompanyProvider() -> TimeRepository {
        return DefaultTimeRepository(dataTransferService: AppDataTransferService().userAuthenticationDataTransferService)
    }
    
}
