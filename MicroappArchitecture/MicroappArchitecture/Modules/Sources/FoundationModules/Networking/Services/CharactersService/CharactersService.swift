//
//  CharactersService.swift
//  MVVMSkeleton
//
//  Created by user on 24.01.2022.
//

import Foundation
import Combine
import Entities

public protocol CharactersService {
    func getCharacters() -> AnyPublisher<[CharacterData], NetworkError>
}
