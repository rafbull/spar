//
//  ItemModel.swift
//  Spar
//
//  Created by Rafis on 01.02.2024.
//

import UIKit

// MARK: - Item Cell Model
struct ItemModel: Hashable {
    let isHasPriceInfoLabel: Bool
    let isHasDiscount: Bool
    let itemImage: UIImage?
    let itemName: String
    let itemPrice: Float
    let priceWithoutDiscount: Float
    let itemPriceForUnit: Float
    let units: [String]
    let itemRating: Float
    let numberOfFeedbacks: Int
    let country: ItemCountry
    let itemDescription: String
    let itemFeatures: [ItemFeature]
}

struct ItemCountry: Hashable {
    let countryImage: UIImage?
    let countryName: String
}

struct ItemFeature: Hashable {
    let featureName: String
    let featureValue: String
}
