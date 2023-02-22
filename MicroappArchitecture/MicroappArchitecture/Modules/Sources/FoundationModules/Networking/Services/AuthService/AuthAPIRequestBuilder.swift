//
//  AuthAPIRequestBuilder.swift
//  MVVMSkeleton
//
//  Created by user on 19.01.2022.
//

import Foundation
import CombineNetworking

public enum AuthAPIRequestBuilder: CNRequestBuilder {
    case login(_ model: UserAuthRequestData)
    case registration(_ model: UserAuthRequestData)
    
    // MARK: - Public Properties
    public var path: String {
        switch self {
        case .login:
            return "/v1/accounts:signInWithPassword"
        case .registration:
            return "/v1/accounts:signUp"
        }
    }
    
    public var query: QueryItems? {
        switch self {
        case .login, .registration:
            return ["returnSecureToken": "true"]
        }
    }
    
    public var body: Data? {
        switch self {
        case .login(let model), .registration(let model):
            return try? JSONEncoder().encode(model)
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .login, .registration:
            return .post
        }
    }
}
