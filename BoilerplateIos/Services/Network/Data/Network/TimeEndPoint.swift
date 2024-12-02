//
//  TimeEndPoint.swift
//  TimeEntry
//
//  Created by outcode  on 18/03/2024.
//

import Foundation

struct TimeEndPoint {
    
    private static var baseUrl: String {
           guard let baseUrl = UserManager.global.getCompanyInfo()?.api else {
               fatalError("Base URL is not available")
           }
           return baseUrl
       }
    
    static func fetchSummaryByDay() -> Endpoint<SummaryDayInfoDTO> {
        return Endpoint(path: "\(baseUrl)api/Time/GetSummaryByDay",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func deleteSummaryByDay(requestDTO: DateRequestDTO) -> Endpoint<Bool> {
        return Endpoint(path: "\(baseUrl)api/Time/DeleteDay/\(requestDTO.year)/\(requestDTO.month)/\(requestDTO.day)",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func copyDay(at requestFromDTO: DateRequestDTO , requestToDTO: DateRequestDTO) -> Endpoint<Bool> {
        return Endpoint(path: "\(baseUrl)api/Time/CopyDay/\(requestFromDTO.year)/\(requestFromDTO.month)/\(requestFromDTO.day)/\(requestToDTO.year)/\(requestToDTO.month)/\(requestToDTO.day)",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func getDefaultTimeList() -> Endpoint<[String]> {
        return Endpoint(path: "\(baseUrl)api/Time/GetDefaultTimesList",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func addDefaultTimeList(at defaulTime: String, requestToDTO: DateRequestDTO) -> Endpoint<Bool>{
        return Endpoint(path: "\(baseUrl)api/Time/AddDefaultTime/\(defaulTime)/\(requestToDTO.year)/\(requestToDTO.month)/\(requestToDTO.day)",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func getAllTime() -> Endpoint<TimeItemResponseDTO>{
        return Endpoint(path: "\(baseUrl)api/Time/GetAllTime",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func deleteTime(at rrn: Int) -> Endpoint<Bool>{
        return Endpoint(path: "\(baseUrl)api/Time/DeleteTime/\(rrn)",
                        isFullPath: true,
                        method: .get
        )
    }
    
    static func copyTime(at rrn: Int) -> Endpoint<Bool>{
        return Endpoint(path: "\(baseUrl)api/Time/CopyTime/\(rrn)",
                        isFullPath: true,
                        method: .get
        )
    }

    static func addTime(at timeItemInfo: TimeItemInfoRequestDTO) -> Endpoint<Bool>{
         if let jsonString = JSONEncoder.encodeToJSON(timeItemInfo) {
                    print(jsonString)
                }
        return Endpoint(path: "\(baseUrl)api/Time/AddTime",
                        isFullPath: true,
                        method: .post,
                        bodyParamatersEncodable: timeItemInfo,
                        bodyEncoding: JSONEncoding.default
                        
                        
        )
    }
}
