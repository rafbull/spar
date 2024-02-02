//
//  QuantityStepView.swift
//  Spar
//
//  Created by Rafis on 01.02.2024.
//

import UIKit

final class QuantityStepView: UIView {
    
    // MARK: - Public Methods
    public func configure(with price: Float) {
        itemPriceLabel.text = String(price)
        priceValue = price
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
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
    
    // MARK: Private Constants
    private enum UIConstants {
        static let quantityButtonsSize: CGFloat = 13
        static let quantityLabelFontSize: CGFloat = 15
        static let itemPriceLabelFontSize: CGFloat = 13
    }
    
    private enum QuantityButtonType: String {
        case minus, plus
    }
    
    // MARK: Private Properties
    private var quantityValue = 1
    private var priceValue: Float = 0.0
    
    lazy private var minusQuantityButton: UIButton = createStepButton(with: .minus)
    lazy private var plusQuantityButton: UIButton = createStepButton(with: .plus)
    
    lazy private var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "\(quantityValue) шт"
        label.textColor = .systemBackground
        label.backgroundColor = .sparGreen
        label.font = .boldSystemFont(ofSize: UIConstants.quantityLabelFontSize)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var itemPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: UIConstants.itemPriceLabelFontSize)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var labelsVStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [quantityLabel, itemPriceLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = -3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // Horizontal stack view for Quantity Button UI elements
    lazy private var quantityButtonHStack: UIStackView = .customHorizontalStackView(
        with: [minusQuantityButton, labelsVStack, plusQuantityButton],
        and: 0
    )
    
    // MARK: Private Methods
    private func setupUI() {
        backgroundColor = .sparGreen
        addSubview(quantityButtonHStack)
        
        minusQuantityButton.addTarget(self, action: #selector(didTapMinusButton), for: .touchUpInside)
        plusQuantityButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            quantityButtonHStack.topAnchor.constraint(equalTo: topAnchor),
            quantityButtonHStack.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            quantityButtonHStack.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            quantityButtonHStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func createStepButton(with imageType: QuantityButtonType) -> UIButton {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: UIConstants.quantityButtonsSize, weight: .bold)
        var image: UIImage?
        
        switch imageType {
        case .minus:
            image = UIImage(systemName: imageType.rawValue, withConfiguration: imageConfig)
        case .plus:
            image = UIImage(systemName: imageType.rawValue, withConfiguration: imageConfig)
        }
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.tintColor = .systemBackground
        button.backgroundColor = UIColor.sparGreen
        button.layer.masksToBounds = true
        button.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    // MARK: Button Actions
    @objc private func didTapMinusButton(_ sender: UIButton) {
        guard quantityValue > 1 else { return }
        // Quantity Reduction
        quantityValue -= 1
        quantityLabel.text = "\(quantityValue) шт"
        
        // Price Reduction
        priceValue /= 2
        itemPriceLabel.text = String(priceValue)
    }
    
    @objc private func didTapPlusButton(_ sender: UIButton) {
        // Quantity Increase
        quantityValue += 1
        quantityLabel.text = "\(quantityValue) шт"
        
        // PriceQuantity
        priceValue *= 2
        itemPriceLabel.text = String(priceValue)
    }
}
