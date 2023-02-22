//
//  CharactersAPIRequestBuilder.swift
//  MVVMSkeleton
//
//  Created by user on 24.01.2022.
//

import Foundation
import CombineNetworking

public enum CharactersAPIRequestBuilder: CNRequestBuilder {
    case getCharacters
    
    // MARK: - Public Properties
    public var path: String { "/results.json" }
    public var query: QueryItems? { nil }
    public var body: Data? { nil }
    public var method: HTTPMethod { .get }
}
