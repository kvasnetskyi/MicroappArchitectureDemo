//
//  UserServiceImpl.swift
//
//  Created by Artem Kvasnetskyi on 15.12.2022.
//

import Foundation
import KeychainAccess
import Entities

final public class UserServiceImpl: UserService {
    // MARK: - Public Properties
    public var isAuthorized: Bool {
        keychain[Key.token.rawValue] != nil
    }
    
    public var token: String? {
        keychain[Key.token.rawValue]
    }
    
    public var refreshToken: String? {
        keychain[Key.refreshToken.rawValue]
    }
    
    // MARK: - Private Properties
    private let keychain: Keychain
    
    // MARK: - Init
    public init(bundleId: String) {
        self.keychain = Keychain(service: bundleId)
    }
}

// MARK: - Public Methods
public extension UserServiceImpl {
    func save(_ model: UserAuthData) {
        keychain[Key.token.rawValue] = model.idToken
        keychain[Key.refreshToken.rawValue] = model.refreshToken
    }
    
    func clear() {
        Key.allCases.forEach { keychain[$0.rawValue] = nil }
    }
}

// MARK: - Keys
private extension UserServiceImpl {
    enum Key: String, CaseIterable {
        case token = "secure_token_key"
        case refreshToken = "secure_refresh_token_key"
    }
}
