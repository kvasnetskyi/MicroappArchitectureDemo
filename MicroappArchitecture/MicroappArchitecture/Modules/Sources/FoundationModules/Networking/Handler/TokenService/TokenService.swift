//
//  TokenService.swift
//  MVVMSkeleton
//
//  Created by user on 19.01.2022.
//

import Combine
import CombineNetworking
import Entities

public protocol TokenService {
    func refreshToken(_ model: TokenRequestData) -> AnyPublisher<UserAuthData, CNError>
}
