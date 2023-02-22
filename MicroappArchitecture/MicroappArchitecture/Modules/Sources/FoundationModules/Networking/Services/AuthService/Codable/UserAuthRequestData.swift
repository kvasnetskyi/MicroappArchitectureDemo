//
//  UserAuthRequestData.swift
//  MVVMSkeleton
//
//  Created by user on 19.01.2022.
//

import Foundation

public struct UserAuthRequestData: Encodable {
    public let email: String
    public let password: String
}
