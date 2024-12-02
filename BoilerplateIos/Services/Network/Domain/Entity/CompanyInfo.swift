//
//  CompanyInfo.swift
//  TimeEntry
//
//  Created by outcode  on 22/02/2024.
//

import Foundation

public struct CompanyInfo: Codable {
    
    public var name:String
    public var api:String
    public var logo:String
    public var logoNight:String
    public var companyNumber:String
    public var library:String
    public var year: String
    public var colorSchemeRed: String
    public var colorSchemeGreen: String
    public var colorSchemeBlue: String

    public init(name: String, api: String, logo: String, logoNight: String, companyNumber: String, library: String, year: String, colorSchemeRed: String, colorSchemeGreen: String , colorSchemeBlue: String) {
        self.name = name
        self.api = api
        self.logo = logo
        self.logoNight = logoNight
        self.companyNumber = companyNumber
        self.library = library
        self.year = year
        self.colorSchemeRed = colorSchemeRed
        self.colorSchemeGreen = colorSchemeGreen
        self.colorSchemeBlue = colorSchemeBlue
    }
}


struct CompanyDefaultValues {
    static let defaultCompanyInfo = CompanyInfo(
        name: "CTI - Test",
        api: "https://timeentryapi.cti-id.com/",
        logo: "https://timeentryapi.cti-id.com/logos/cti.png",
        logoNight: "https://timeentryapi.cti-id.com/logos/ctiNight.png",
        companyNumber: "01",
        library: "CLIMTG",
        year: "23",
        colorSchemeRed: "27",
        colorSchemeGreen: "160",
        colorSchemeBlue: "225"
    )
}
