//
//  AuthenticationRepository.swift
//  TimeEntry
//
//  Created by outcode  on 22/02/2024.
//

import Foundation

public protocol AuthenticationRepository {
    
    var accessToken: String? {get}

    func storeAccessToken(token: String)
    func removeAll(completion:@escaping ((Result<String,Error>) -> Void))
    
    @discardableResult
    func register(companyKey:String, completion: @escaping((Result<CompanyInfo, Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func login(loginInfo:LogInInfo, completion: @escaping ((Result<UserAccessInfo, Error>)-> Void)) -> Resumable?
    
}
