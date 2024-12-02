//
//  WorkOrderInfo.swift
//  TimeEntry
//
//  Created by outcode  on 07/06/2024.
//


import Foundation

public struct WorkOrderInfo: Codable {
    
    let number, description: String
    let closeGLOptions: [CloseGLInfo]
    let companyCode: String
  
    init(number: String, description: String, closeGLOptions: [CloseGLInfo], companyCode: String) {
        self.number = number
        self.description = description
        self.closeGLOptions = closeGLOptions
        self.companyCode = companyCode
    }
    
}
public struct CloseGLInfo: Codable {
    
    let number, glExtension, description: String
  
    init(number: String, glExtension: String, description: String) {
        self.number = number
        self.glExtension = glExtension
        self.description = description
    }
    
    
}
