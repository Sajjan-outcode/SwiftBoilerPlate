//
//  DefaultAuthenticationRepository.swift
//  TimeEntry
//
//  Created by outcode  on 22/02/2024.
//

import Foundation

public final class DefaultAuthenticationRepository {
    
    private let dataTransferService: DataTransferService
    private let loginDataStore: LoginDataStore
    
    public init(dataTransferService: DataTransferService, loginDataStore: LoginDataStore) {
        self.dataTransferService = dataTransferService
        self.loginDataStore = loginDataStore
    }
}

extension DefaultAuthenticationRepository: AuthenticationRepository {
   
    public var accessToken: String? {
        return loginDataStore.getAccessToken()
    }
 
    public func storeAccessToken(token: String) {
        self.loginDataStore.saveAccessToken(token: "Bearer\(token)") { _ in
            return
        }
    }
    
    public func removeAll(completion: @escaping ((Result<String, Error>) -> Void)) {
        self.loginDataStore.removeAccessToken { result in
            switch result {
            case .success(let data):
               // UserDefaults.standard.set(nil, forKey: UserDefaultKeys.ACCESS_TOKEN.rawValue)
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func register(companyKey: String, completion: @escaping ((Result<CompanyInfo, Error>) -> Void)) -> Resumable? {
        let endpoint = AuthenticationEndpoint.companyInfo(companyKey: companyKey)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
    }
    
    public func login(loginInfo: LogInInfo, completion: @escaping ((Result<UserAccessInfo, Error>) -> Void)) -> Resumable? {
        let endpoint = AuthenticationEndpoint.authenticateUser(requestDTO: loginInfo.toRequestDTO())
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                self.loginDataStore.saveAccessToken(token: "Bearer \(responseDTO.token)") { _ in
                    completion(.success(responseDTO.toDomain()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }    
}





