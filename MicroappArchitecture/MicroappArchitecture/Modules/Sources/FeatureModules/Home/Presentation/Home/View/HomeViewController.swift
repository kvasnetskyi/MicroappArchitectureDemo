//
//  HomeViewController.swift
//  MVVMSkeleton
//
//  Created by Roman Savchenko on 20.11.2021.
//

import UIKit
import SwiftUI
import Base

final class HomeViewController<VM: HomeViewModel>: BaseViewController<VM> {
    // MARK: - Private Properties
    private let contentView = HomeView()

    // MARK: - Lifecycle
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
        title = Localization.Home.title
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.loadCharacters()
    }
}

// MARK: - Private Methods
private extension HomeViewController {
    func binding() {
        viewModel.characters
            .sink { [weak self] characters in
                self?.contentView.show(characters: characters)
            }
            .store(in: &subscriptions)
    }
}
