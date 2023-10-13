//
//  HomeView.swift
//  MVVMSkeleton
//
//  Created by Roman Savchenko on 14.12.2021.
//

import UIKit
import Extensions
import Entities

final class HomeView: UIView {
    // MARK: - Private Properties
    private let tableView = UITableView()
    private var characters = [CharacterData]()
    
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
extension HomeView: UITableViewDataSource {
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
