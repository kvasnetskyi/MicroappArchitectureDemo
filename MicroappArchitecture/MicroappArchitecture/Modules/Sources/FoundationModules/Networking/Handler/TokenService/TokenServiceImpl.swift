//
//  TokenServiceImpl.swift
//  MVVMSkeleton
//
//  Created by user on 19.01.2022.
//

import Combine
import CombineNetworking
import Entities

public struct TokenServiceImpl: TokenService {
    // MARK: - Private Properties
    private let provider: CNProvider<TokenAPIRequestBuilder, NetworkingHandler>
    
    // MARK: - Init
    public init(_ provider: CNProvider<TokenAPIRequestBuilder, NetworkingHandler>) {
        self.provider = provider
    }
}

// MARK: - Public Methods
public extension TokenServiceImpl {
    func refreshToken(_ model: TokenRequestData) -> AnyPublisher<UserAuthData, CNError> {
        provider.perform(
            .refreshToken(model),
            decodableType: TokenData.self
        )
    }
}
