//
//  AppContainer.swift
//  
//
//  Created by Artem Kvasnetskyi on 19.12.2022.
//

import Foundation
import Swinject
import CombineNetworking
import Networking
import Storage

public protocol AppContainer: AnyObject {
    var userService: UserService { get }
    var authService: AuthService { get }
    var characterService: CharactersService { get }
}

public final class AppContainerImpl: AppContainer {
    // MARK: - Public Properties
    public var userService: UserService { resolve() }
    public var authService: AuthService { resolve() }
    public var characterService: CharactersService { resolve() }

    // MARK: - Private Properties
    private let swinject = Container()
    private let configuration: AppConfiguration

    // MARK: - Init
    public init(_ configuration: AppConfiguration) {
        self.configuration = configuration

        registerServices()
    }
}

// MARK: - Private Methods
private extension AppContainerImpl {
    func registerServices() {
        registerUserService()
        registerTokenPlugin()
        registerNetworkingHandler()
        registerTokenService()
        registerAuthService()
        registerCharactersService()
    }

    func resolve<T>() -> T {
        swinject.resolve(T.self)!
    }

    func registerUserService() {
        swinject.register(UserService.self) { [unowned self] resolver in
            return UserServiceImpl(bundleId: configuration.bundleId)
        }
        .inObjectScope(.container)
    }

    func registerTokenPlugin() {
        swinject.register(TokenPlugin.self) { resolver in
            let userService = resolver.resolve(UserService.self)!

            return TokenPlugin(userService)
        }
    }

    func registerNetworkingHandler() {
        swinject.register(NetworkingHandler.self) { _ in
            NetworkingHandler()
        }
        .initCompleted { resolver, handler in
            handler.tokenService = resolver.resolve(TokenService.self)!
            handler.userService = resolver.resolve(UserService.self)!
        }
    }

    func registerTokenService() {
        swinject.register(TokenService.self) { [unowned self] resolver in
            let networkingHandler = resolver.resolve(NetworkingHandler.self)!
            let jsonPugin = JSONContentPlugin()
            let keyPlugin = APIKeyPlugin(
                key: configuration.environment.authAPIKey
            )

            let provider = CNProvider(
                baseURL: configuration.environment.tokenBaseURL,
                errorHandler: networkingHandler,
                requestBuilder: TokenAPIRequestBuilder.self,
                plugins: [jsonPugin, keyPlugin]
            )

            return TokenServiceImpl(provider)
        }
    }

    func registerAuthService() {
        swinject.register(AuthService.self) { [unowned self] resolver in
            let networkingHandler = resolver.resolve(NetworkingHandler.self)!
            let jsonPugin = JSONContentPlugin()
            let keyPlugin = APIKeyPlugin(
                key: configuration.environment.authAPIKey
            )

            let provider = CNProvider(
                baseURL: configuration.environment.authBaseURL,
                errorHandler: networkingHandler,
                requestBuilder: AuthAPIRequestBuilder.self,
                plugins: [jsonPugin, keyPlugin]
            )

            return AuthServiceImpl(provider)
        }
    }

    func registerCharactersService() {
        swinject.register(CharactersService.self) { [unowned self] resolver in
            let networkingHandler = resolver.resolve(NetworkingHandler.self)!
            let tokenPlugin = resolver.resolve(TokenPlugin.self)!
            let jsonPugin = JSONContentPlugin()

            let provider = CNProvider(
                baseURL: configuration.environment.storageBaseURL,
                errorHandler: networkingHandler,
                requestBuilder: CharactersAPIRequestBuilder.self,
                plugins: [jsonPugin, tokenPlugin]
            )

            return CharactersServiceImpl(provider)
        }
    }
}
