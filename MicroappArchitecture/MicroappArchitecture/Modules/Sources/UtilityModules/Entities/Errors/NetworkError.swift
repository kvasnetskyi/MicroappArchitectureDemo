//
//  NetworkError.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation

public struct NetworkError: AppError {
    public var localizedDescription: String
    
    public init(_ description: String) {
        localizedDescription = description
    }
}
