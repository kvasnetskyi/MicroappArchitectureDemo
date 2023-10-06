//
//  ViewRenderingState.swift
//  
//
//  Created by Artem Kvasnetskyi on 04.01.2023.
//

import SwiftUI
import Combine
import Entities
import Views
import Resources

public struct ViewRenderingState {
    // MARK: - Private Properties
    fileprivate var alert: AlertModel = .init()
    fileprivate var isLoading: Bool = false
}

// MARK: - Public Methods
public extension ViewRenderingState {
    mutating func render(_ state: Render) {
        switch state {
        case .alert(let message):
            isLoading = false
            alert = .init(
                isAlertPresented: true,
                alertMessage: message
            )
            
        case .error(let error):
            isLoading = false
            alert = .init(
                isAlertPresented: true,
                alertMessage: error.localizedDescription
            )
            
        case .loading:
            alert = .init()
            isLoading = true
            
        case .view:
            alert = .init()
            isLoading = false
        }
    }
}

// MARK: - Models
public extension ViewRenderingState {
    enum Render {
        case view
        case loading
        case alert(message: String)
        case error(_ error: AppError)
    }
    
    struct AlertModel {
        var isAlertPresented: Bool = false
        var alertMessage: String?
    }
}

// MARK: - View + ViewRenderingState
public extension View {
    func subscribeToRenderingStates<VM: ViewModel>(
        _ viewModel: ObservedObject<VM>.Wrapper
    ) -> some View {
        self
            .overlay {
                if viewModel.renderingState.isLoading.wrappedValue {
                    LoadingView.swiftUIView(isLoading: .constant(true))
                }
            }
            .alert(
                viewModel.renderingState.alert.alertMessage.wrappedValue ?? .init(),
                isPresented: viewModel.renderingState.alert.isAlertPresented
            ) {
                Button(ReusableLocalization.ok) {
                    viewModel.renderingState.alert.isAlertPresented.wrappedValue = false
                    viewModel.renderingState.alert.alertMessage.wrappedValue = nil
                }
            }
    }
}

// MARK: - BaseViewController + ViewRenderingState
extension BaseViewController {
    func subscribeToRenderingStates() {
        viewModel.renderingStatePublisher
            .sink { [weak self] state in
                if state.isLoading {
                    self?.showLoadingView()
                } else {
                    self?.hideLoadingView()
                }
                
                if state.alert.isAlertPresented, let message = state.alert.alertMessage {
                    self?.showAlert(message: message)
                } else {
                    self?.alert?.dismiss(animated: true)
                }
            }
            .store(in: &subscriptions)
    }
    
    private func showLoadingView() {
        let loadingView = LoadingView(frame: UIScreen.main.bounds)
        loadingView.isLoading = true
        
        view?.addSubview(loadingView)
    }
    
    private func hideLoadingView() {
        view.subviews
            .first(where: { $0 is LoadingView })?
            .removeFromSuperview()
    }
    
    private func showAlert(
        title: String = ReusableLocalization.error,
        message: String
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: ReusableLocalization.ok,
            style: .default
        ) { [weak viewModel] _ in
            viewModel?.renderingState.alert = .init()
        }
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        self.alert = alertController
    }
}
