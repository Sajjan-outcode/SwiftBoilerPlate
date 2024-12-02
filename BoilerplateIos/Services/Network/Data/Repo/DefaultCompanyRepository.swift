//
//  DefaultCompanyRepository.swift
//  TimeEntry
//
//  Created by outcode  on 14/03/2024.
//

import Foundation

public final class DefaultCompanyRepository {
    
    private let dataTransferService: DataTransferService
    
    public init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
}

extension DefaultCompanyRepository: CompanyRepository {
    
    
    public func getWorkOrderInfo(with statePaidInCode: String, completion: @escaping ((Result<[WorkOrderInfo], any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = CompanyEndPoint.fetchWorkOrder(with: statePaidInCode)
        
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                if let jsonString = JSONEncoder.encodeToJSON(responseDTO) {
                            print(jsonString)
                        }
                completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
    }
    

    
    public func getAllowOverTimeInfo(completion: @escaping ((Result<AllowOverTimeInfo, any Error>) -> Void)) -> (any Resumable)? {
        
        let endpoint = CompanyEndPoint.fetchAllowOverTime()
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                if let jsonString = JSONEncoder.encodeToJSON(responseDTO) {
                            print(jsonString)
                        }
                completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
    }
    
    public func getTruckInfo(completion: @escaping ((Result<[TruckInfo], any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = CompanyEndPoint.fetchGetTruck()
        
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                if let jsonString = JSONEncoder.encodeToJSON(responseDTO) {
                            print(jsonString)
                        }
                completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
    }
    
    
    public func getStatePaidInfo(completion: @escaping ((Result<[StatePaidInInfo], any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = CompanyEndPoint.fetchStatePaidIn()
        
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                if let jsonString = JSONEncoder.encodeToJSON(responseDTO) {
                            print(jsonString)
                        }
                completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
        
    }
    
    public func getLabourFunction(completion: @escaping ((Result<[LabourFunctionInfo], any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = CompanyEndPoint.fetchLabourFunction()
        
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                if let jsonString = JSONEncoder.encodeToJSON(responseDTO) {
                            print(jsonString)
                        }
                completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
        
    }
    
    public func getEmployeeInfo(completion: @escaping ((Result<EmployeeInfo, any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = CompanyEndPoint.fetchEmployee()
        
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                if let jsonString = JSONEncoder.encodeToJSON(responseDTO) {
                            print(jsonString)
                        }
                completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
    }
}
