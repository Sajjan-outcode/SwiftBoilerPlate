//
//  AuthProvider.swift
//  TimeEntry
//
//  Created by outcode  on 22/02/2024.
//

import Foundation

class AuthProvider {
    
    public static var shared: AuthProvider {
        return singleton
    }
    private static let singleton: AuthProvider = AuthProvider()
    private var authRepository: AuthenticationRepository?
    
    func makeLoginRepository() -> AuthenticationRepository {
        let dataStore = LoginDataStore()
        if authRepository == nil {
            authRepository = DefaultAuthenticationRepository(dataTransferService: AppDataTransferService().defaultDataTransferService, loginDataStore: dataStore)
            return authRepository!
        }else {
            return authRepository!
        }
    }
}
