//
//  TokenAPIRequestBuilder.swift
//  MVVMSkeleton
//
//  Created by user on 19.01.2022.
//

import Foundation
import CombineNetworking

public enum TokenAPIRequestBuilder: CNRequestBuilder {
    case refreshToken(_ model: TokenRequestData)
    
    // MARK: - Internal Properties
    public var path: String { "/v1/token" }
    public var query: QueryItems? { nil }
    public var method: HTTPMethod { .post }
    public var body: Data? {
        switch self {
        case .refreshToken(let model):
            return try? JSONEncoder().encode(model)
        }
    }
}
