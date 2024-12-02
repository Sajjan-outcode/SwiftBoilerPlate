//
//  UserProvider.swift
//  TimeEntry
//
//  Created by outcode  on 14/03/2024.
//

import Foundation

class CompanyProvider {
    
    public static var shared: CompanyProvider {
        return singleton
        
    }
    private static let singleton: CompanyProvider = CompanyProvider()
    private var companyRepository: CompanyRepository?
    
    func makeCompanyProvider() -> CompanyRepository {
        return DefaultCompanyRepository(dataTransferService: AppDataTransferService().userAuthenticationDataTransferService)
    }
    
}
