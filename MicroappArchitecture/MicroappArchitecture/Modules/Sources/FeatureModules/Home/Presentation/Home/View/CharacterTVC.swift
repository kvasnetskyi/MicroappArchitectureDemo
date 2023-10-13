//
//  CharacterTVC.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import UIKit
import Kingfisher
import Entities
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
        labelsStack.setup(axis: .vertical, spacing: C.LabelsStack.spacing)
        
        statusLabel.font = UIFont.systemFont(ofSize: C.LabelsStack.statusFontSize, weight: .medium)
        statusLabel.textColor = .lightGray
        
        nameLabel.font = UIFont.systemFont(ofSize: C.LabelsStack.nameFontSize, weight: .bold)
        
        speciesLabel.font = UIFont.systemFont(ofSize: C.LabelsStack.speciesFontSize)
        speciesLabel.textColor = .gray
        
        genderLabel.font = UIFont.systemFont(ofSize: C.LabelsStack.genderFontSize)
        genderLabel.textColor = .gray
        
        
        labelsStack.addArranged(statusLabel)
        labelsStack.addArranged(nameLabel)
        labelsStack.addArranged(speciesLabel)
        labelsStack.addArranged(genderLabel)
        
        let mainStack = UIStackView()
        mainStack.setup(axis: .horizontal, spacing: C.MainStack.spacing)
        
        let imageContainer = UIView(
            frame: CGRect(
                origin: .zero,
                size: CGSize(
                    width: C.MainStack.imageSize,
                    height: C.MainStack.imageSize
                )
            )
        )
        
        imageContainer.backgroundColor = .clear
        imageContainer.rounded()
        imageContainer.addSubviewToCenter(
            characterImage,
            width: C.MainStack.imageSize,
            height: C.MainStack.imageSize
        )
        
        mainStack.addArranged(imageContainer, size: C.MainStack.imageSize)
        mainStack.addArranged(labelsStack)
        
        addSubview(
            mainStack,
            withEdgeInsets: C.insets,
            safeArea: false
        )
    }
}

// MARK: - Static Properties
private enum C {
    static let insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    enum LabelsStack {
        static let spacing = 5.0
        static let statusFontSize = 12.0
        static let nameFontSize = 21.0
        static let speciesFontSize = 16.0
        static let genderFontSize = 16.0
    }
    
    enum MainStack {
        static let spacing = 20.0
        static let imageSize = 100.0
    }
}
