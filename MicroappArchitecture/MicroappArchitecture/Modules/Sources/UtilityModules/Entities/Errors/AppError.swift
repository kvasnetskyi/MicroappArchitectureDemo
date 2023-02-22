//
//  AppError.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation

public protocol AppError: Error {
    var localizedDescription: String { get }
}
