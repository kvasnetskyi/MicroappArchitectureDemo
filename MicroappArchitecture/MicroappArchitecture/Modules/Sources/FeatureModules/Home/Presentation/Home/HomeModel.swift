//
//  HomeModel.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import Foundation
import Combine
import Entities

protocol HomeModel {
    func getCharacters() -> AnyPublisher<[CharacterData], NetworkError>
}

final class HomeModelImpl {
    // MARK: - Private Properties
    private let dependecies: HomeDependencies
    
    // MARK: - Init
    init(dependecies: HomeDependencies) {
        self.dependecies = dependecies
    }
}

// MARK: - HomeModel
extension HomeModelImpl: HomeModel {
    func getCharacters() -> AnyPublisher<[CharacterData], NetworkError> {
        dependecies.loadCharactersAction()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
