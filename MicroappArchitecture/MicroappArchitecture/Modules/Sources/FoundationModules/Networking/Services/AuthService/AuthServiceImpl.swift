//
//  AuthServiceImpl.swift
//  MVVMSkeleton
//
//  Created by Roman Savchenko on 20.11.2021.
//

import Foundation
import Combine
import CombineNetworking
import Entities

public struct AuthServiceImpl: AuthService {
    // MARK: - Private Properties
    private let provider: CNProvider<AuthAPIRequestBuilder, NetworkingHandler>
    
    // MARK: - Init
    public init(_ provider: CNProvider<AuthAPIRequestBuilder, NetworkingHandler>) {
        self.provider = provider
    }
}

// MARK: - Public Methods
public extension AuthServiceImpl {
    func login(
        email: String, password: String
    ) -> AnyPublisher<UserAuthData, NetworkError> {
        provider.perform(
            .login(
                .init(email: email, password: password)
            ),
            decodableType: UserData.self
        )
        .eraseToNetworkError()
    }
    
    func registration(
        email: String, password: String
    ) -> AnyPublisher<UserAuthData, NetworkError> {
        provider.perform(
            .registration(
                .init(email: email, password: password)
            ),
            decodableType: UserData.self
        )
        .eraseToNetworkError()
    }
}
