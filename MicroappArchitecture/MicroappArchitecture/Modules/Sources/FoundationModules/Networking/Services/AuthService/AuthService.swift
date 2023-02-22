//
//  AuthService.swift
//  MVVMSkeleton
//
//  Created by user on 19.01.2022.
//

import Combine
import Entities

public protocol AuthService {
    func login(
        email: String, password: String
    ) -> AnyPublisher<UserAuthData, NetworkError>
    
    func registration(
        email: String, password: String
    ) -> AnyPublisher<UserAuthData, NetworkError>
}
