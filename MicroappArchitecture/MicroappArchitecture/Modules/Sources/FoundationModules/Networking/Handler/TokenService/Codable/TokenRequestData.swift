//
//  TokenRequestData.swift
//  
//
//  Created by Artem Kvasnetskyi on 15.12.2022.
//

import Foundation

public struct TokenRequestData: Encodable {
    // MARK: - Public Properties
    public let refreshToken: String
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case grantType = "grant_type"
        case refreshToken = "refresh_token"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(refreshToken, forKey: .refreshToken)
        try container.encode("refresh_token", forKey: .grantType)
    }
}
