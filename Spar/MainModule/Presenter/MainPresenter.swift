//
//  MainPresenter.swift
//  Spar
//
//  Created by Rafis on 30.01.2024.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    init(viewController: MainViewProtocol)
    func getDataForTableView()
    func getDataForBottomView()
}

final class MainPresenter: MainViewPresenterProtocol {
    
    weak var viewController: MainViewProtocol?
    private var itemModel: [MainTableViewRow]?
    private var feedbackModel: [MainTableViewRow]?
    
    init(viewController: MainViewProtocol) {
        self.viewController = viewController
    }
    
    func getDataForTableView() {
        getDataFromServer()
        
        guard
            let itemModel = itemModel,
            let feedbackModel = feedbackModel
        else { return  }
        
        viewController?.updateTableView(with: itemModel, and: feedbackModel)
    }
    
    func getDataForBottomView() {
        getDataFromServer()
        
        guard let itemModel = itemModel else { return }
        
        switch itemModel.first {
        case.item(let itemModel):
            viewController?.updateBottomView(with: itemModel)
        default:
            break
        }
    }
    
    private func getDataFromServer() {
        //
        // Fetching data from the server...
        //
        itemModel = MockData.getProductItem()
        feedbackModel = MockData.getProductFeedback()
    }
}
