//
//  UIStackView+Extensions.swift
//  
//
//  Created by Artem Kvasnetskyi on 28.12.2022.
//

import UIKit

public extension UIStackView {
    func setup(
        axis: NSLayoutConstraint.Axis = .vertical,
        alignment: Alignment = .fill,
        distribution: Distribution = .fill,
        spacing: CGFloat = .zero
    ) {
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
    }

    func removeAllViews() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }

    func addSpacer(_ size: CGFloat? = nil) {
        let spacer = UIView()
        spacer.backgroundColor = .clear
        addArranged(spacer, size: size)
    }

    func addArranged(
        _ view: UIView,
        size: CGFloat? = nil
    ) {
        addArrangedSubview(view)
        
        guard let size = size else { return }
        switch axis {
        case .vertical:
            view.heightAnchor.constraint(
                equalToConstant: size
            )
            .isActive = true
            
        case .horizontal:
            view.widthAnchor.constraint(
                equalToConstant: size
            )
            .isActive = true
            
        default: return
        }
    }

    func addCentered(_ view: UIView, inset: CGFloat, size: CGFloat? = nil) {
        let stack = UIStackView()
        switch axis {
        case .vertical:
            stack.setup(
                axis: .horizontal,
                alignment: .fill,
                distribution: .fill,
                spacing: .zero
            )
        case .horizontal:
            stack.setup(
                axis: .vertical,
                alignment: .fill,
                distribution: .fill,
                spacing: .zero
            )
        default: return
        }
        
        stack.addSpacer(inset)
        stack.addArranged(view)
        stack.addSpacer(inset)
        addArranged(stack, size: size)
    }
}
