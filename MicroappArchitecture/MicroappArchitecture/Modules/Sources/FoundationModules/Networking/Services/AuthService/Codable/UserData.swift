//
//  UserData.swift
//  
//
//  Created by Artem Kvasnetskyi on 28.12.2022.
//

import Foundation
import Entities

public struct UserData: Decodable, UserAuthData {
    public let idToken: String
    public let refreshToken: String
}
