//
//  BaseViewModel.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import Foundation
import Combine

public protocol ViewModel: ObservableObject {
    var renderingState: ViewRenderingState { get set }
    var renderingStatePublisher: AnyPublisher<ViewRenderingState, Never> { get }
}

open class BaseViewModel: ViewModel {
    // MARK: - Public Properties
    @Published public var renderingState: ViewRenderingState = .init()
    public lazy var renderingStatePublisher = $renderingState.eraseToAnyPublisher()
    
    public var subscriptions = Set<AnyCancellable>()
    
    public init() {}
}
