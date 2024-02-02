//
//  MainViewController.swift
//  Spar
//
//  Created by Rafis on 30.01.2024.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func updateTableView(with itemData: [MainTableViewRow], and itemFeedback: [MainTableViewRow])
    func updateBottomView(with itemData: ItemModel)
}

final class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
        createDataSource()
        setupUI()
        setConstraints()
        
        presenter?.getDataForTableView()
        presenter?.getDataForBottomView()
    }
    
    // MARK: - Pirvate Constants
    private enum UIConstants {
        static let bottomViewHeightMultiplier: CGFloat = 0.3
        static let navigationBarItemsPointSize: CGFloat = 17
    }
    
    private enum CellID {
        static let item = "ItemCell"
        static let feedback = "FeedbackCell"
    }
    
    // MARK: - Private Properties
    lazy private var tableView = UITableView()
    private var dataSource: MainTableViewDiffableDataSource!
    
    lazy private var bottomView: BottomView = {
        let view = BottomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        
        navigationController?.navigationBar.tintColor = .sparGreen
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: UIConstants.navigationBarItemsPointSize, weight: .semibold)
        
        // Left Bar Buttons
        let backImage = UIImage(systemName: "arrow.left", withConfiguration: imageConfig)
        let backBarButton = UIBarButtonItem(image: backImage, style: .done, target: self, action: #selector(didTapBackBarButton))
                
        navigationItem.setLeftBarButtonItems([backBarButton], animated: true)
        
        // Right Bar Buttons
        let billImage = UIImage(systemName: "doc.plaintext", withConfiguration: imageConfig)
        let billBarButton = UIBarButtonItem(image: billImage, style: .done, target: self, action: #selector(didTapBillBarButton))
        
        let shareImage = UIImage(systemName: "square.and.arrow.up", withConfiguration: imageConfig)
        let shareBarButton = UIBarButtonItem(image: shareImage, style: .done, target: self, action: #selector(didTapBillBarButton))
        
        let heartImage = UIImage(systemName: "heart", withConfiguration: imageConfig)
        let heartBarButton = UIBarButtonItem(image: heartImage, style: .done, target: self, action: #selector(didTapHeartBarButton))
        
        navigationItem.setRightBarButtonItems([heartBarButton, shareBarButton, billBarButton], animated: true)
    }
    
    @objc private func didTapBackBarButton(_ sender: UIBarButtonItem) {
    }
    @objc private func didTapBillBarButton(_ sender: UIBarButtonItem) {
    }
    @objc private func didTapHeartBarButton(_ sender: UIBarButtonItem) {
    }
    
    // MARK: Setting up TableView
    private func setupTableView() {
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: CellID.item)
        tableView.register(FeedbackTableViewCell.self, forCellReuseIdentifier: CellID.feedback)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func handleRefreshControl(_ sender: UIRefreshControl) {
        // Mock table update
        if sender.isRefreshing {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                sender.endRefreshing()
            }
        }
    }
    
    // MARK: Create Data Source
    private func createDataSource() {
        dataSource = MainTableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .item(let itemModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: CellID.item, for: indexPath) as! ItemTableViewCell
                cell.configure(with: itemModel)
                return cell
            case .feedback(let feedbackModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: CellID.feedback, for: indexPath) as! FeedbackTableViewCell
                cell.configure(with: feedbackModel)
                return cell
            }
        })
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        view.addSubview(bottomView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: UIConstants.bottomViewHeightMultiplier),
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor)
        ])
    }
}

// MARK: Extension
extension MainViewController: MainViewProtocol {
    func updateTableView(with itemData: [MainTableViewRow], and itemFeedback: [MainTableViewRow]) {
        var snapshot = dataSource.snapshot()
                
        snapshot.appendSections([.item, .feedback])
        snapshot.appendItems(itemData, toSection: .item)
        snapshot.appendItems(itemFeedback, toSection: .feedback)
        
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    func updateBottomView(with itemData: ItemModel) {
        bottomView.configure(with: itemData)
    }
}
