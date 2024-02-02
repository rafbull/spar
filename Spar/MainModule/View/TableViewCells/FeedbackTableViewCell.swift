//
//  FeedbackTableViewCell.swift
//  Spar
//
//  Created by Rafis on 31.01.2024.
//

import UIKit

final class FeedbackTableViewCell: UITableViewCell {
    
    // MARK: - Public Methods
    public func configure(with data: [FeedbackModel]) {
        
        updateCollectionView(with: data)
        
        allFeedbacksButton.setTitle("Все \(data.count)", for: .normal)
    }
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCollectionView()
        createDataSource()
        setupUI()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        leaveFeedbackButton.layer.cornerRadius = leaveFeedbackButton.bounds.height / 2
    }
    
    // MARK: - Private Constants
    private enum UIConstants {
        static let feedbackHeaderLabelFontSize: CGFloat = 20
        static let allFeedbacksButtonFontSize: CGFloat = 17
        static let leaveFeedbackButtonFontSize: CGFloat = 17
        static let leaveFeedbackButtonBorderWidth: CGFloat = 2
        
        static let collectionCellHeight: CGFloat = UIScreen.main.bounds.width * 0.4
        static let collectionItemWidth: CGFloat = UIScreen.main.bounds.width * 0.6
        static let collectionItemHeight: CGFloat = collectionCellHeight - 16
        static let collectionViewSectionInsets: CGFloat = 16
    }
    
    private enum CellID {
        static let savedStoriesItem = "FeedbackCollectionViewCell"
    }
    
    // MARK: - Pirvate Properties
    private var collectionView: UICollectionView!
    private var dataSource: FeedbackCollectionViewDiffableDataSource!
    
    private let feedbackHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Отзывы"
        label.font = .boldSystemFont(ofSize: UIConstants.feedbackHeaderLabelFontSize)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var allFeedbacksButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .boldSystemFont(ofSize: UIConstants.allFeedbacksButtonFontSize)
        button.tintColor = .sparGreen
        button.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Horizontal stack view for feedback header UI elements
    lazy private var feedbackHeaderHStack: UIStackView = .customHorizontalStackView(
        with: [feedbackHeaderLabel, allFeedbacksButton],
        and: 0
    )
    
    private var leaveFeedbackButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Оставить отзыв", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: UIConstants.leaveFeedbackButtonFontSize)
        button.tintColor = .sparGreen
        button.layer.borderWidth = UIConstants.leaveFeedbackButtonBorderWidth
        button.layer.borderColor = UIColor.sparGreen.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Private Methods
    // Setting up CollectionView
    private func setupCollectionView() {
        let itemWidth = UIConstants.collectionItemWidth
        let itemHeight = UIConstants.collectionItemHeight
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.sectionInset.left = UIConstants.collectionViewSectionInsets
        layout.sectionInset.right = UIConstants.collectionViewSectionInsets
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FeedbackCollectionViewCell.self, forCellWithReuseIdentifier: CellID.savedStoriesItem)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: Create Data Source
    private func createDataSource() {
        dataSource = FeedbackCollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID.savedStoriesItem, for: indexPath) as! FeedbackCollectionViewCell
            cell.configure(with: itemIdentifier)
            return cell
        })
    }
    
    private func updateCollectionView(with data: [FeedbackModel]) {
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(data, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    private func setupUI() {
        contentView.addSubview(feedbackHeaderHStack)
        contentView.addSubview(collectionView)
        contentView.addSubview(leaveFeedbackButton)
    }
    
    private func setConstraints() {
        let contentViewMarginsGuide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            feedbackHeaderHStack.topAnchor.constraint(equalTo: contentViewMarginsGuide.topAnchor),
            feedbackHeaderHStack.leadingAnchor.constraint(equalTo: contentViewMarginsGuide.leadingAnchor),
            allFeedbacksButton.trailingAnchor.constraint(equalTo: contentViewMarginsGuide.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: feedbackHeaderHStack.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: UIConstants.collectionCellHeight),
            
            leaveFeedbackButton.topAnchor.constraint(equalToSystemSpacingBelow: collectionView.bottomAnchor, multiplier: 1),
            leaveFeedbackButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            leaveFeedbackButton.widthAnchor.constraint(equalTo: contentViewMarginsGuide.widthAnchor),
            leaveFeedbackButton.bottomAnchor.constraint(equalTo: contentViewMarginsGuide.bottomAnchor)
        ])
    }
}
