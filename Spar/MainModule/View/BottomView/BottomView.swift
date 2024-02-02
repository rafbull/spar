//
//  BottomView.swift
//  Spar
//
//  Created by Rafis on 01.02.2024.
//

import UIKit

final class BottomView: UIView {
    // MARK: - Public Methods
    public func configure(with data: ItemModel) {
        data.units
            .enumerated()
            .forEach{ segmentedControl.insertSegment(withTitle: $0.element, at: $0.offset, animated: true) }
        segmentedControl.selectedSegmentIndex = 0
        
        itemPriceForUnitLabel.text = String(data.itemPriceForUnit)
        priceWithoutDiscountLabel.text = String(data.priceWithoutDiscount)
        quantityButton.configure(with: data.itemPrice)
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
        layer.backgroundColor = UIColor.systemBackground.cgColor
                
        layer.shadowOpacity = 0.03
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: -7.0)
        layer.shadowRadius = 5
    }
    
    // MARK: - Private Constants
    private enum UIConstants {
        static let viewLayoutMargins: UIEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
        static let itemPriceLabelFontSize: CGFloat = 30
        static let mesurementUnitsViewFontSize: CGFloat = 9
        static let priceWithoutDiscountLabelFontSize: CGFloat = 11
        static let priceWithoutDiscountLabelVerticalOffset: CGFloat = -3
        static let quantityButtonWidthMultiplier: CGFloat = 0.4
    }

    // MARK: - Private Properties
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let quantityButton: QuantityStepView = {
        let view = QuantityStepView()
        return view
    }()
    
    private let itemPriceForUnitLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.itemPriceLabelFontSize, weight: .heavy)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mesurementUnitsView: MeasurementUnitsView = {
        let view = MeasurementUnitsView()
        view.setLabelsFont(.boldSystemFont(ofSize: UIConstants.mesurementUnitsViewFontSize))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Horizontal stack view for Quantity Button UI elements
    lazy private var priceAndQuantityHStack: UIStackView = .customHorizontalStackView(
        with: [itemPriceForUnitLabel, mesurementUnitsView, quantityButton],
        and: 0
    )
    
    private let priceWithoutDiscountLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSAttributedString(
            string: "-",
            attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        )
        label.attributedText = attributedText
        label.font = .boldSystemFont(ofSize: UIConstants.priceWithoutDiscountLabelFontSize)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 11
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Private Methods
    private func setupUI() {
        layoutMargins = UIConstants.viewLayoutMargins
        addSubview(mainVStackView)
        addSubview(priceWithoutDiscountLabel)
        mainVStackView.addArrangedSubview(segmentedControl)
        mainVStackView.addArrangedSubview(priceAndQuantityHStack)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainVStackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            mainVStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            mainVStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            mainVStackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            priceWithoutDiscountLabel.leadingAnchor.constraint(equalTo: mainVStackView.leadingAnchor),
            priceWithoutDiscountLabel.topAnchor.constraint(
                equalTo: mainVStackView.bottomAnchor,
                constant: UIConstants.priceWithoutDiscountLabelVerticalOffset
            ),

            quantityButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: UIConstants.quantityButtonWidthMultiplier)
        ])
    }
}
