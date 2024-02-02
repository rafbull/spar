//
//  FeedbackCollectionViewCell.swift
//  Spar
//
//  Created by Rafis on 01.02.2024.
//

import UIKit

final class FeedbackCollectionViewCell: UICollectionViewCell {
    // MARK: - Public Methods
    public func configure(with data: FeedbackModel) {
        userNameLabel.text = data.userName
        feedbackDateLabel.text = data.feedbackDate
        feedbackDescriptionLabel.text = data.feedbackText
        
        setFeedbackRaiting(with: data.feedbackRate)
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
        
        layer.cornerRadius = UIConstants.viewCornerRadius
        
        layer.shadowOpacity = 0.1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 5
    }
    
    // MARK: - Private Constants
    private enum UIConstants {
        static let viewCornerRadius: CGFloat = 10
        static let userNameLabelFontSize: CGFloat = 17
        static let feedbackDateLabelFontSize: CGFloat = 14
        static let feedbackDescriptionLabelFontSize: CGFloat = 14
        static let maxCountOfRaitingStars: Int = 5
    }
    
    // MARK: - Private Properties
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: UIConstants.userNameLabelFontSize)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let feedbackDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.feedbackDateLabelFontSize)
        label.textAlignment = .left
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    // Horizontal stack view for item raiting UI elements
    lazy private var raitingStarsHStack: UIStackView = .customHorizontalStackView(
        with: createRaitingStarsArray(),
        and: 3
    )
    
    private let feedbackDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.feedbackDescriptionLabelFontSize)
        label.numberOfLines = 3
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let feedbackVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = -2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Private Methods
    private func setupUI() {
        contentView.addSubview(feedbackVStackView)
        feedbackVStackView.addArrangedSubview(userNameLabel)
        feedbackVStackView.addArrangedSubview(feedbackDateLabel)
        feedbackVStackView.addArrangedSubview(raitingStarsHStack)
        feedbackVStackView.addArrangedSubview(feedbackDescriptionLabel)
    }
    
    private func setConstraints() {
        let contentViewMarginsGuide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            feedbackVStackView.topAnchor.constraint(equalTo: contentViewMarginsGuide.topAnchor),
            feedbackVStackView.leadingAnchor.constraint(equalTo: contentViewMarginsGuide.leadingAnchor),
            feedbackVStackView.trailingAnchor.constraint(equalTo: contentViewMarginsGuide.trailingAnchor),
            feedbackVStackView.bottomAnchor.constraint(equalTo: contentViewMarginsGuide.bottomAnchor),
        ])
    }
}

//MARK: Extension
private extension FeedbackCollectionViewCell {
    // This method cheks user's feedback raiting and sets yellow starts
    func setFeedbackRaiting(with raiting: Int) {
        guard raiting <= raitingStarsHStack.arrangedSubviews.count else { return }
        
        raitingStarsHStack.arrangedSubviews.enumerated()
            .filter { $0.offset < raiting }
            .forEach { $0.element.tintColor = .systemYellow }
    }
    
    func createRaitingStarsArray() -> [UIImageView] {
        var starImageViews = [UIImageView]()
        for _ in 0..<UIConstants.maxCountOfRaitingStars {
            let imageView = UIImageView()
            imageView.tintColor = .systemGray6
            imageView.image = UIImage(systemName: "star.fill")
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            starImageViews.append(imageView)
        }
        return starImageViews
    }
}
