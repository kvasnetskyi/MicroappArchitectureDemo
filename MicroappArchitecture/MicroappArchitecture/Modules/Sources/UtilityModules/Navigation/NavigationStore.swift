//
//  NavigationStore.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation

public final class NavigationStore<Route: Hashable>: ObservableObject {
    // MARK: - Public Properties
    @Published public var route = [Route]()
    
    // MARK: - Init
    public init() {}
}

// MARK: - Public Methods
public extension NavigationStore {
    func pop() {
        route.removeLast()
    }
    
    func push(_ route: Route) {
        self.route.append(route)
    }
    
    func popToRoot() {
        route.removeAll()
    }
}
