//
//  UIView+Extensions.swift
//  
//
//  Created by Artem Kvasnetskyi on 09.01.2023.
//

import UIKit
import KeyboardLayoutGuide

public extension UIView {
    func addSubview(_ other: UIView, constraints: [NSLayoutConstraint]) {
        addSubview(other)
        other.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func addSubview(_ other: UIView, withEdgeInsets edgeInsets: UIEdgeInsets, safeArea: Bool = true, bottomToKeyboard: Bool = false) {
        if safeArea {
            if bottomToKeyboard {
                addSubview(other, constraints: [
                    other.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: edgeInsets.left),
                    other.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: edgeInsets.top),
                    other.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -edgeInsets.right),
                    other.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor, constant: -edgeInsets.bottom)
                ])
            } else {
                addSubview(other, constraints: [
                    other.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: edgeInsets.left),
                    other.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: edgeInsets.top),
                    other.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -edgeInsets.right),
                    other.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -edgeInsets.bottom)
                ])
            }
        } else {
            if bottomToKeyboard {
                addSubview(other, constraints: [
                    other.leadingAnchor.constraint(equalTo: leadingAnchor, constant: edgeInsets.left),
                    other.topAnchor.constraint(equalTo: topAnchor, constant: edgeInsets.top),
                    other.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -edgeInsets.right),
                    other.bottomAnchor.constraint(equalTo: keyboardLayoutGuideNoSafeArea.topAnchor, constant: -edgeInsets.bottom)
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
    }
    
    func constraints(for view: UIView,
                     by edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    ) -> [NSLayoutConstraint] {
        [
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: edgeInsets.left),
            view.topAnchor.constraint(equalTo: topAnchor, constant: edgeInsets.top),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -edgeInsets.right),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edgeInsets.bottom)
        ]
    }
    
    func constraintsToSafeArea(for view: UIView,
                               by edgeInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    ) -> [NSLayoutConstraint] {
        [
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: edgeInsets.left),
            view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: edgeInsets.top),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -edgeInsets.right),
            view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -edgeInsets.bottom)
        ]
    }
    
    func centerConstrains(for view: UIView, offsetX: CGFloat = 0, offsetY: CGFloat = 0) -> [NSLayoutConstraint] {
        [
            view.centerYAnchor.constraint(equalTo: centerYAnchor, constant: offsetY),
            view.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offsetX)
        ]
    }
    
    func addSubviewToCenter(_ other: UIView) {
        addSubview(other, constraints: [
            other.centerYAnchor.constraint(equalTo: centerYAnchor),
            other.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func addSubviewToCenter(_ other: UIView, width: CGFloat, height: CGFloat) {
        addSubview(other, constraints: [
            other.centerYAnchor.constraint(equalTo: centerYAnchor),
            other.centerXAnchor.constraint(equalTo: centerXAnchor),
            other.heightAnchor.constraint(equalToConstant: height),
            other.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    func insertSubview(_ other: UIView, belowSubview: UIView, constraints: [NSLayoutConstraint]) {
        insertSubview(other, belowSubview: belowSubview)
        other.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func insertSubview(_ other: UIView, aboveSubview: UIView, constraints: [NSLayoutConstraint]) {
        insertSubview(other, aboveSubview: aboveSubview)
        other.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func insertSubview(_ other: UIView, index: Int, constraints: [NSLayoutConstraint]) {
        insertSubview(other, at: index)
        other.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func bordered(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }

    func rounded() {
        rounded(min(bounds.width, bounds.height) / 2)
    }

    func rounded(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
