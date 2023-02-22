//
//  HomeViewModel.swift
//  MVVMSkeleton
//
//  Created by Roman Savchenko on 20.11.2021.
//

import Combine
import Foundation
import Base
import Entities

protocol HomeViewModel: ViewModel {
    var characters: AnyPublisher<[CharacterData], Never> { get }
    
    func loadCharacters()
}

final class HomeViewModelImpl: BaseViewModel, HomeViewModel {
    // MARK: - Internal Properties
    lazy var characters = charactersSubject.eraseToAnyPublisher()
    
    // MARK: - Private Properties
    private let charactersSubject = CurrentValueSubject<[CharacterData], Never>([])
    private let model: HomeModel
    
    // MARK: - Init
    init(_ model: HomeModel) {
        self.model = model
        super.init()
    }
}

// MARK: - Internal Methods
extension HomeViewModelImpl {
    func loadCharacters() {
        renderingState.render(.loading)
        
        model.getCharacters()
            .sink { [weak self] completion in
                guard case let .failure(error) = completion else {
                    self?.renderingState.render(.view)
                    return
                }
                
                self?.renderingState.render(.error(error))
                
            } receiveValue: { [weak self] response in
                self?.charactersSubject.value = response
            }
            .store(in: &subscriptions)
    }
}
