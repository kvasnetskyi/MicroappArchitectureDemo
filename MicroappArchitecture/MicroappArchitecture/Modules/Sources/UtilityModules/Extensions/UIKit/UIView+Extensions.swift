//
//  UIView+Extensions.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import UIKit

public extension UIView {
    func addSubview(_ other: UIView, constraints: [NSLayoutConstraint]) {
        addSubview(other)
        other.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func addSubview(
        _ other: UIView,
        withEdgeInsets edgeInsets: UIEdgeInsets,
        safeArea: Bool = true
    ) {
        if safeArea {
            addSubview(other, constraints: [
                other.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: edgeInsets.left),
                other.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: edgeInsets.top),
                other.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -edgeInsets.right),
                other.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -edgeInsets.bottom)
            ])
            
        } else {
            addSubview(other, constraints: [
                other.leadingAnchor.constraint(equalTo: leadingAnchor, constant: edgeInsets.left),
                other.topAnchor.constraint(equalTo: topAnchor, constant: edgeInsets.top),
                other.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -edgeInsets.right),
                other.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edgeInsets.bottom)
            ])
        }
    }
    
    func addSubviewToCenter(_ other: UIView, width: CGFloat, height: CGFloat) {
        addSubview(other, constraints: [
            other.centerYAnchor.constraint(equalTo: centerYAnchor),
            other.centerXAnchor.constraint(equalTo: centerXAnchor),
            other.heightAnchor.constraint(equalToConstant: height),
            other.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    func rounded() {
        rounded(min(bounds.width, bounds.height) / 2)
    }

    func rounded(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
