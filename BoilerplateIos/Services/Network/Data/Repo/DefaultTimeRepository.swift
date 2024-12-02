//
//  DefaultTimeRepository.swift
//  TimeEntry
//
//  Created by outcode  on 18/03/2024.
//

import Foundation

public final class DefaultTimeRepository {
    
    private let dataTransferService: DataTransferService
    
    public init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
}

extension DefaultTimeRepository: TimeRepository {
    
    public func addTime(at requestData: TimeItemInfoRequestDTO, completion: @escaping ((Result<Bool, any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = TimeEndPoint.addTime(at: requestData)
       
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
    }
    

    
    public func getAllTime(completion: @escaping ((Result<[TimeItemInfo], any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = TimeEndPoint.getAllTime()
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
    
    
    public func sendDefaultTime(at defaultDate: String , with requestDTO: DateRequestDTO, completion: @escaping ((Result<Bool, any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = TimeEndPoint.addDefaultTimeList(at: defaultDate, requestToDTO: requestDTO)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
    
    
    
    public func getDefaultTimeList(completion: @escaping ((Result<[String], any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = TimeEndPoint.getDefaultTimeList()
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
    }
    
    
    
    public func copyDay(fromDate: DateRequestDTO, toDate: DateRequestDTO, completion: @escaping ((Result<Bool, any Error>) -> Void)) -> (any Resumable)? {
        
        let endpoint = TimeEndPoint.copyDay(at: fromDate, requestToDTO: toDate)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
    }
    
   

    public func deleteSummaryByDay(requestData: DateRequestDTO, completion: @escaping ((Result<Bool, any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = TimeEndPoint.deleteSummaryByDay(requestDTO: requestData)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
    }
    
    public func getSummaryByDay(completion: @escaping ((Result<[SummaryDayInfo], any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = TimeEndPoint.fetchSummaryByDay()
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
    
    public func deleteTime(at rrn: Int, completion: @escaping ((Result<Bool, any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = TimeEndPoint.deleteTime(at: rrn)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
    }
    
    public func copyTime(at rrn: Int, completion: @escaping ((Result<Bool, any Error>) -> Void)) -> (any Resumable)? {
        let endpoint = TimeEndPoint.copyTime(at: rrn)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        return task?.toResumable()
    }
  
  
}
