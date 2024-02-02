//
//  ItemTableViewCell.swift
//  Spar
//
//  Created by Rafis on 31.01.2024.
//

import UIKit

final class ItemTableViewCell: UITableViewCell {
    
    // MARK: - Public Methods
    public func configure(with data: ItemModel) {
        priceInfoLabel.isHidden = !data.isHasPriceInfoLabel
        itemImageView.image = data.itemImage
        itemRaitingLabel.text = String(data.itemRating)
        numberOfFeedbacksLabel.text = "| \(data.numberOfFeedbacks) отзывов"
        discountImageView.isHidden = !data.isHasDiscount
        itemNameLabel.text = data.itemName
        countryImageView.image = data.country.countryImage
        countryNameLabel.text = data.country.countryName
        itemDescriptionLabel.text = data.itemDescription
        
        // Vertical stack view for item features UI elements
        createItemFeatureLabelStacks(with: data.itemFeatures).forEach { itemFeatureHStack in
            itemFeatureVStackView.addArrangedSubview(itemFeatureHStack)
        }
    }

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Constants
    private enum UIConstants {
        static let priceInfoLabelCornerRadius: CGFloat = 3
        static let priceInfoLabelWidth: CGFloat = 13
        static let priceInfoLabelHeight: CGFloat = 23
        static let priceInfoLabelFontSize: CGFloat = priceInfoLabelHeight * 0.5
        static let priceInfoLabelWidthMultiplier: CGFloat = 0.3
        static let itemImageViewHeightMultiplier: CGFloat = 0.8
        static let itemRaitingLabelFontSize: CGFloat = 17
        static let discountImageViewWidth: CGFloat = 60
        static let discountImageViewHeightMultiplier: CGFloat = 0.5
        static let itemNameLabelFontSize: CGFloat = 30
        static let itemNameLabelTopMultiplier: CGFloat = 2
        static let countryImageViewSize: CGFloat = 30
        static let descriptionHeaderLabelFontSize: CGFloat = 17
        static let featuresHeaderLabelFontSize: CGFloat = 17
        static let itemFeatureLabelFontSize: CGFloat = 15
        static let allFeaturesButtonFontSize: CGFloat = 17
        static let itemCountryHStackTopMultiplier: CGFloat = 3
        static let descriptionHeaderLabelTopMultiplier: CGFloat = 3
        static let itemDescriptionLabelTopMultiplier: CGFloat = 3
        static let featuresHeaderLabelTopMultiplier: CGFloat = 3
        static let itemFeatureVStackViewTopMultiplier: CGFloat = 3
        static let allFeaturesButtonTopMultiplier: CGFloat = 1
    }
    
    // MARK: - Private Properties
    private let priceInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Цена по карте"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: UIConstants.priceInfoLabelFontSize)
        label.textColor = .systemBackground
        label.backgroundColor = .sparGreen
        label.layer.cornerRadius = UIConstants.priceInfoLabelCornerRadius
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let raitingStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemYellow
        imageView.image = UIImage(systemName: "star.fill")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let itemRaitingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: UIConstants.itemRaitingLabelFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberOfFeedbacksLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Horizontal stack view for item raiting UI elements
    lazy private var itemRaitingHStack: UIStackView = .customHorizontalStackView(
        with: [raitingStarImageView, itemRaitingLabel, numberOfFeedbacksLabel],
        and: 3
    )
    
    private let discountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "discount")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let itemNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: UIConstants.itemNameLabelFontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = UIConstants.countryImageViewSize / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let countryNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Horizontal stack view for item сountry UI elements
    lazy private var itemCountryHStack: UIStackView = .customHorizontalStackView(
        with: [countryImageView, countryNameLabel],
        and: 8
    )
    
    private let descriptionHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        label.font = .boldSystemFont(ofSize: UIConstants.descriptionHeaderLabelFontSize)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let featuresHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Основные характеристики"
        label.font = .boldSystemFont(ofSize: UIConstants.featuresHeaderLabelFontSize)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let itemFeatureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var itemFeatureVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var allFeaturesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Все характеристики", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: UIConstants.allFeaturesButtonFontSize)
        button.tintColor = .sparGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Private Methods
    private func setupUI() {
        contentView.addSubview(priceInfoLabel)
        contentView.addSubview(itemImageView)
        contentView.addSubview(itemRaitingHStack)
        contentView.addSubview(discountImageView)
        contentView.addSubview(itemNameLabel)
        contentView.addSubview(itemCountryHStack)
        contentView.addSubview(descriptionHeaderLabel)
        contentView.addSubview(itemDescriptionLabel)
        contentView.addSubview(featuresHeaderLabel)
        contentView.addSubview(itemFeatureLabel)
        contentView.addSubview(itemFeatureVStackView)
        contentView.addSubview(allFeaturesButton)
    }
    
    private func setConstraints() {
        let contentViewMarginsGuide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            priceInfoLabel.topAnchor.constraint(equalTo: contentViewMarginsGuide.topAnchor),
            priceInfoLabel.leadingAnchor.constraint(equalTo: contentViewMarginsGuide.leadingAnchor),
            priceInfoLabel.widthAnchor.constraint(
                equalTo: contentViewMarginsGuide.widthAnchor,
                multiplier: UIConstants.priceInfoLabelWidthMultiplier
            ),
            priceInfoLabel.heightAnchor.constraint(equalToConstant: UIConstants.priceInfoLabelHeight),
            
            itemImageView.topAnchor.constraint(equalTo: priceInfoLabel.bottomAnchor),
            itemImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            itemImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            itemImageView.heightAnchor.constraint(
                equalTo: itemImageView.widthAnchor,
                multiplier: UIConstants.itemImageViewHeightMultiplier
            ),

            itemRaitingHStack.topAnchor.constraint(equalTo: itemImageView.bottomAnchor),
            itemRaitingHStack.leadingAnchor.constraint(equalTo: contentViewMarginsGuide.leadingAnchor),
            
            discountImageView.topAnchor.constraint(equalTo: itemRaitingHStack.topAnchor),
            discountImageView.trailingAnchor.constraint(equalTo: contentViewMarginsGuide.trailingAnchor),
            discountImageView.widthAnchor.constraint(equalToConstant: UIConstants.discountImageViewWidth),
            discountImageView.heightAnchor.constraint(
                equalTo: discountImageView.widthAnchor,
                multiplier: UIConstants.discountImageViewHeightMultiplier
            ),
            
            itemNameLabel.leadingAnchor.constraint(equalTo: contentViewMarginsGuide.leadingAnchor),
            itemNameLabel.trailingAnchor.constraint(equalTo: contentViewMarginsGuide.trailingAnchor),
            itemNameLabel.topAnchor.constraint(
                equalToSystemSpacingBelow: itemRaitingHStack.bottomAnchor,
                multiplier: UIConstants.itemNameLabelTopMultiplier
            ),
            
            itemCountryHStack.leadingAnchor.constraint(equalTo: contentViewMarginsGuide.leadingAnchor),
            itemCountryHStack.topAnchor.constraint(
                equalToSystemSpacingBelow: itemNameLabel.bottomAnchor,
                multiplier: UIConstants.itemCountryHStackTopMultiplier
            ),
            countryImageView.widthAnchor.constraint(equalToConstant: UIConstants.countryImageViewSize),
            countryImageView.heightAnchor.constraint(equalToConstant: UIConstants.countryImageViewSize),
            
            descriptionHeaderLabel.leadingAnchor.constraint(equalTo: contentViewMarginsGuide.leadingAnchor),
            descriptionHeaderLabel.topAnchor.constraint(
                equalToSystemSpacingBelow: itemCountryHStack.bottomAnchor,
                multiplier: UIConstants.descriptionHeaderLabelTopMultiplier
            ),
            
            itemDescriptionLabel.leadingAnchor.constraint(equalTo: contentViewMarginsGuide.leadingAnchor),
            itemDescriptionLabel.trailingAnchor.constraint(equalTo: contentViewMarginsGuide.trailingAnchor),
            itemDescriptionLabel.topAnchor.constraint(
                equalToSystemSpacingBelow: descriptionHeaderLabel.bottomAnchor,
                multiplier: UIConstants.itemDescriptionLabelTopMultiplier
            ),
            
            featuresHeaderLabel.leadingAnchor.constraint(equalTo: contentViewMarginsGuide.leadingAnchor),
            featuresHeaderLabel.topAnchor.constraint(
                equalToSystemSpacingBelow: itemDescriptionLabel.bottomAnchor,
                multiplier: UIConstants.featuresHeaderLabelTopMultiplier
            ),
            
            itemFeatureVStackView.leadingAnchor.constraint(equalTo: contentViewMarginsGuide.leadingAnchor),
            itemFeatureVStackView.trailingAnchor.constraint(equalTo: contentViewMarginsGuide.trailingAnchor),
            itemFeatureVStackView.topAnchor.constraint(
                equalToSystemSpacingBelow: featuresHeaderLabel.bottomAnchor,
                multiplier: UIConstants.itemFeatureVStackViewTopMultiplier
            ),
            
            allFeaturesButton.topAnchor.constraint(
                equalToSystemSpacingBelow: itemFeatureVStackView.bottomAnchor,
                multiplier: UIConstants.allFeaturesButtonTopMultiplier
            ),
            allFeaturesButton.leadingAnchor.constraint(equalTo: contentViewMarginsGuide.leadingAnchor),
            allFeaturesButton.bottomAnchor.constraint(equalTo: contentViewMarginsGuide.bottomAnchor)
        ])
    }
}

// MARK: Extension
private extension ItemTableViewCell {
    func createItemFeatureLabelStacks(with features: [ItemFeature]) -> [UIStackView] {
        var itemFeaturesHStacks = [UIStackView]()
        
        features.forEach { feature in
            let featureNameLabel = UILabel()
            featureNameLabel.text = feature.featureName
            featureNameLabel.font = .systemFont(ofSize: UIConstants.itemFeatureLabelFontSize)
            featureNameLabel.numberOfLines = 0
            featureNameLabel.textAlignment = .left
            featureNameLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let dashedLineView = DashedLineView()
            dashedLineView.translatesAutoresizingMaskIntoConstraints = false
            
            let featureValueLabel = UILabel()
            featureValueLabel.text = feature.featureValue
            featureValueLabel.font = .systemFont(ofSize: UIConstants.itemFeatureLabelFontSize)
            featureValueLabel.numberOfLines = 0
            featureValueLabel.textAlignment = .right
            featureValueLabel.translatesAutoresizingMaskIntoConstraints = false
            
            itemFeaturesHStacks.append(UIStackView.customHorizontalStackView(with: [featureNameLabel, dashedLineView, featureValueLabel], and: 5))
        }
        return itemFeaturesHStacks
    }
}
