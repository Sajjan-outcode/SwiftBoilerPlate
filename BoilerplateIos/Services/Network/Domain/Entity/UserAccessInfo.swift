//
//  UserAccessInfo.swift
//  TimeEntry
//
//  Created by outcode  on 22/02/2024.
//

import Foundation

public struct UserAccessInfo: Equatable {
    public let accessToken: String?

    public init(accessToken: String?) {
        self.accessToken = accessToken
    }
}
