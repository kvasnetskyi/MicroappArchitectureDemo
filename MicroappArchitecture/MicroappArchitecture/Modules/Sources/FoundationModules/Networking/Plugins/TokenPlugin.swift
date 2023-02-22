//
//  TokenPlugin.swift
//  MVVMSkeleton
//
//  Created by user on 14.12.2021.
//

import Foundation
import CombineNetworking
import Storage

public struct TokenPlugin: CNPlugin {
    // MARK: - Private Properties
    private let userService: UserService
    
    // MARK: - Init
    public init(_ userService: UserService) {
        self.userService = userService
    }
}

// MARK: - Public Methods
public extension TokenPlugin {
    func modifyRequest(_ request: inout URLRequest) {
        guard let url = request.url,
              let token = userService.token,
              var components = URLComponents(string: url.absoluteString) else { return }
        
        var queryItems = components.queryItems ?? []
        queryItems.append(
            URLQueryItem(name: "auth", value: token)
        )
        
        components.queryItems = queryItems
        
        guard let newURL = components.url else { return }
        request.url = newURL
    }
}
