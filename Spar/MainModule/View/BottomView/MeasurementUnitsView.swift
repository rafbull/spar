//
//  MeasurementUnitsView.swift
//  Spar
//
//  Created by Rafis on 02.02.2024.
//

import UIKit

final class MeasurementUnitsView: UIView {
    
    // MARK: Public Methods
    public func setLabelsFont(_ font: UIFont) {
        priceLabel.font = font
        unitsLabel.font = font
    }
    
    public func setPriceLabelTitle(_ text: String) {
        priceLabel.text = text
    }
    
    public func setUnitsLabelTitle(_ text: String) {
        unitsLabel.text = text
    }

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Drawing View
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let containerWidth = container.bounds.width
        let containerHeight = container.bounds.height
        let containerOrigin = container.frame.origin
        
        let path = UIBezierPath()
        path.lineWidth = 1
        path.move(to: CGPoint(x: containerOrigin.x, y: containerHeight + 3))
        path.addLine(to: CGPoint(x: containerWidth + containerOrigin.x * 0.5, y: containerOrigin.y + 5))
        UIColor.label.setStroke()
        path.stroke()
    }
    
    // MARK: Private Properties
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "₽"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let unitsLabel: UILabel = {
        let label = UILabel()
        label.text = "кг"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    // MARK: - Private Methods
    private func setupUI() {
        backgroundColor = .systemBackground
        
        container.addSubview(priceLabel)
        container.addSubview(unitsLabel)
        addSubview(container)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: container.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),

            unitsLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            unitsLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            
            container.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            container.heightAnchor.constraint(equalTo: priceLabel.heightAnchor, multiplier: 2),
            container.trailingAnchor.constraint(equalTo: unitsLabel.trailingAnchor),
        ])
    }
}
