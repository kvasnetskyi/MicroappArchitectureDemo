//
//  CharactersServiceImpl.swift
//  MVVMSkeleton
//
//  Created by user on 24.01.2022.
//

import Foundation
import Combine
import CombineNetworking
import Entities

public struct CharactersServiceImpl: CharactersService {
    // MARK: - Private Properties
    private let provider: CNProvider<CharactersAPIRequestBuilder, NetworkingHandler>
    
    // MARK: - Init
    public init(_ provider: CNProvider<CharactersAPIRequestBuilder, NetworkingHandler>) {
        self.provider = provider
    }
}

// MARK: - Public Methods
public extension CharactersServiceImpl {
    func getCharacters() -> AnyPublisher<[CharacterData], NetworkError> {
        provider.perform(.getCharacters)
            .eraseToNetworkError()
    }
}
