//
//  JSONContentPlugin.swift
//  MVVMSkeleton
//
//  Created by user on 22.01.2022.
//

import Foundation
import CombineNetworking

public struct JSONContentPlugin: CNPlugin {
    // MARK: - Init
    public init() {}
}

// MARK: - Public Methods
public extension JSONContentPlugin {
    func modifyRequest(_ request: inout URLRequest) {
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
