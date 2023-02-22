//
//  HomeDependencies.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import Foundation
import Combine
import Entities

public struct HomeDependencies {
    // MARK: - Internal Properties
    var loadCharactersAction: () -> AnyPublisher<[CharacterData], NetworkError>
    
    // MARK: - Init
    public init(
        loadCharactersAction: @escaping () -> AnyPublisher<[CharacterData], NetworkError>
    ) {
        self.loadCharactersAction = loadCharactersAction
    }
}
