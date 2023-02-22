//
//  CharacterTVC.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import UIKit
import Kingfisher
import Entities
import Helpers
import Extensions

final class CharacterTVC: UITableViewCell {
    // MARK: - Private Properties
    private let genderLabel = UILabel()
    private let nameLabel = UILabel()
    private let speciesLabel = UILabel()
    private let statusLabel = UILabel()
    private let characterImage = UIImageView()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}

// MARK: - Internal Methods
extension CharacterTVC {
    func setup(_ model: CharacterData) {
        characterImage.kf.setImage(with: model.image)
        statusLabel.text = model.status
        nameLabel.text = model.name
        genderLabel.text = "\(Localization.Gender.prefix) \(model.gender)"
        speciesLabel.text = "\(Localization.Species.prefix) \(model.species)"
    }
}

// MARK: - Private Methods
private extension CharacterTVC {
    func commonInit() {
        let labelsStack = UIStackView()
        labelsStack.setup(axis: .vertical, spacing: 5)
        
        statusLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        statusLabel.textColor = .lightGray
        
        nameLabel.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        
        speciesLabel.font = UIFont.systemFont(ofSize: 16)
        speciesLabel.textColor = .gray
        
        genderLabel.font = UIFont.systemFont(ofSize: 16)
        genderLabel.textColor = .gray
        
        
        labelsStack.addArranged(statusLabel)
        labelsStack.addArranged(nameLabel)
        labelsStack.addArranged(speciesLabel)
        labelsStack.addArranged(genderLabel)
        
        let mainStack = UIStackView()
        mainStack.setup(axis: .horizontal, spacing: 20)
        
        let imageContainer = UIView(
            frame: CGRect(
                origin: .zero,
                size: CGSize(
                    width: 100,
                    height: 100
                )
            )
        )
        
        imageContainer.backgroundColor = .clear
        imageContainer.rounded()
        imageContainer.addSubviewToCenter(
            characterImage,
            width: 100,
            height: 100
        )
        
        mainStack.addArranged(imageContainer, size: 100)
        mainStack.addArranged(labelsStack)
        
        addSubview(
            mainStack,
            withEdgeInsets: UIEdgeInsets(
                top: 20,
                left: 20,
                bottom: 20,
                right: 20
            ),
            safeArea: false
        )
    }
}

// MARK: - Preview Provider
import SwiftUI

struct CharacterTVCPreview: PreviewProvider {
    static var previews: some View {
        ViewRepresentable(
            CharacterTVC(frame: CGRect(x: 0, y: 100, width: 300, height: 200))
        ) {
            $0.setup(.placeholder)
        }
        .previewLayout(.fixed(width: 400.0, height: 150))
    }
}
