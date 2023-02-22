//
//  Route.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation

enum Route: Hashable {
    case signIn
    case signUp
}

enum Transition {
    case route(_ route: Route)
    case pop
}
