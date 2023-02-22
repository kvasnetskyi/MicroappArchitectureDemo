//
//  DidSet.swift
//  
//
//  Created by Artem Kvasnetskyi on 28.12.2022.
//

import Combine

/// Custom property wrapper. Publisher sends an event after the property has been changed.
///
/// Used to create a property that can behave like a Combine publisher.
///
/// Example usage:
/// ```swift
/// class SomeClass: UIViewController {
///     @DidSet public var error: Error?
///     @DidSet public var isActive = true
///
///     var subscriptions = Set<AnyCancellable>()
///
///     func binding() {
///         $error
///             .sink { [weak self] error in
///                 // Do smth
///             }
///             .store(in: &subscriptions)
///
///         $isActive
///             .assign(
///                 to: \.isUserInteractionEnabled,
///                 on: view
///             )
///             .store(in: &subscriptions)
///     }
/// }
/// ```
///
@propertyWrapper
final public class DidSet<Value> {
    // MARK: - Private Properties
    private var value: Value
    private let subject: CurrentValueSubject<Value, Never>
    
    // MARK: - Public Properties
    public var wrappedValue: Value {
        set {
            value = newValue
            subject.send(value)
        }
        get {
            value
        }
    }
    
    public var projectedValue: CurrentValueSubject<Value, Never> {
        get { subject }
    }
    
    // MARK: - Init
    public init(wrappedValue: Value) {
        self.value = wrappedValue
        subject = CurrentValueSubject(wrappedValue)
    }
}
