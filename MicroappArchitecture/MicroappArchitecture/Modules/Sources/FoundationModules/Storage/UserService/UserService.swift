//
//  UserService.swift
//
//  Created by Artem Kvasnetskyi on 15.12.2022.
//

import Foundation
import Entities

public protocol UserService: AnyObject {
    var isAuthorized: Bool { get }
    var token: String? { get }
    var refreshToken: String? { get }
    
    func save(_ model: UserAuthData)
    func clear()
}
