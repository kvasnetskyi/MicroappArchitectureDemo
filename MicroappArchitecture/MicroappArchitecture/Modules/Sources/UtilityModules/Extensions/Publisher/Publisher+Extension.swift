//
//  Publisher+Extension.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Combine

public extension Publisher where Self.Output == Never {
    func sink(
        _ completion: @escaping ((Subscribers.Completion<Self.Failure>) -> Void)
    ) -> AnyCancellable {
        self
            .sink { result in
                completion(result)
                
            } receiveValue: { _ in }
    }
}
