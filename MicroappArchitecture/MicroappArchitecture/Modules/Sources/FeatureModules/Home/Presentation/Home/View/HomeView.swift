//
//  HomeView.swift
//  MVVMSkeleton
//
//  Created by Roman Savchenko on 14.12.2021.
//

import UIKit
import Combine
import Extensions
import Entities
import Helpers

final class HomeView: UIView {
    // MARK: - Private Properties
    private let tableView = UITableView()
    private var characters = [CharacterData]()
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Internal Methods
extension HomeView {
    func show(characters: [CharacterData]) {
        self.characters = characters
        self.tableView.reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

// MARK: - Private Methods
private extension HomeView {
    func commonInit() {
        setupLayout()
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.register(
            CharacterTVC.self,
            forCellReuseIdentifier: C.cellReuseIdentifier
        )
    }

    func setupLayout() {
        addSubview(tableView, withEdgeInsets: .zero, safeArea: true)
    }
}

// MARK: - UITableViewDataSource
extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return characters.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: C.cellReuseIdentifier,
            for: indexPath
        ) as! CharacterTVC
        
        let model = characters[indexPath.row]
        cell.setup(model)
        
        return cell
    }
}

// MARK: - Static Properties
private struct C {
    static let cellReuseIdentifier: String = "UITableViewCell"
}

// MARK: - Preview Provider
import SwiftUI

struct HomeViewPreview: PreviewProvider {
    static var previews: some View {
        ViewRepresentable(HomeView()) {
            $0.show(
                characters: [
                    .placeholder,
                    .placeholder
                ]
            )
        }
    }
}
