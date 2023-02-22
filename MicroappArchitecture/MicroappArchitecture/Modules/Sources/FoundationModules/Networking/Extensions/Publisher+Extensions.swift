//
//  Publisher+Extensions.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation
import Combine
import CombineNetworking
import Entities

public extension Publisher where Self.Failure == CNError {
    func eraseToNetworkError() -> AnyPublisher<Self.Output, NetworkError> {
        self
            .mapError { error in
                NetworkError(
                    error.description ?? CNError.unspecifiedError.description!
                )
            }
            .eraseToAnyPublisher()
    }
}
