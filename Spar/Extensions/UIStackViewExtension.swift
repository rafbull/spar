//
//  UIStackViewExtension.swift
//  Spar
//
//  Created by Rafis on 01.02.2024.
//

import UIKit

// Custom Horizontal Stack View
extension UIStackView {
    class func customHorizontalStackView(with views: [UIView], and spacing: CGFloat) -> UIStackView {
        let horizontalStackView = UIStackView(arrangedSubviews: views)
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = spacing
        horizontalStackView.distribution = .fill
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        return horizontalStackView
    }
}
