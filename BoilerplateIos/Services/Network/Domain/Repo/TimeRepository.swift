//
//  TimeRepository.swift
//  TimeEntry
//
//  Created by outcode  on 18/03/2024.
//

import Foundation

public protocol TimeRepository {
    
    @discardableResult
    func getSummaryByDay(completion: @escaping((Result<[SummaryDayInfo], Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func deleteSummaryByDay(requestData: DateRequestDTO,completion: @escaping((Result<Bool, Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func copyDay(fromDate: DateRequestDTO , toDate: DateRequestDTO ,completion: @escaping((Result<Bool, Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func getDefaultTimeList(completion: @escaping((Result<[String], Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func sendDefaultTime(at defaultDate: String ,with requestDate: DateRequestDTO,completion: @escaping((Result<Bool, Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func getAllTime(completion: @escaping((Result<[TimeItemInfo], Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func deleteTime(at rrn: Int ,completion: @escaping((Result<Bool, Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func copyTime(at rrn: Int ,completion: @escaping((Result<Bool, Error>)-> Void)) -> Resumable?
    
    @discardableResult
    func addTime(at requestData: TimeItemInfoRequestDTO, completion: @escaping((Result<Bool, Error>)-> Void)) -> Resumable?
}
