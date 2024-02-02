//
//  MockData.swift
//  Spar
//
//  Created by Rafis on 01.02.2024.
//

import UIKit

struct MockData {
    static func getProductItem() -> [MainTableViewRow] {
        [
            .item(ItemModel(isHasPriceInfoLabel: true,
                            isHasDiscount: true,
                            itemImage: UIImage(named: "Item_001"),
                            itemName: "Добавка \"Липа\" к чаю 200 г",
                            itemPrice: 120.0,
                            priceWithoutDiscount: 199.0,
                            itemPriceForUnit: 55.9,
                            units: ["Шт", "Кг"],
                            itemRating: 4.1,
                            numberOfFeedbacks: 19,
                            country: ItemCountry(countryImage: UIImage(named: "SpainFlag"), countryName: "Испания, Риоха"),
                            itemDescription: "Флавоноиды липового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов.",
                            itemFeatures: [
                                ItemFeature(featureName: "Производство", featureValue: "Россия, Краснодарский край"),
                                ItemFeature(featureName: "Энергетическая ценность, ккал/100 г", featureValue: "25 ккал, 105 кДж"),
                                ItemFeature(featureName: "Жиры/100 г", featureValue: "0,1 г"),
                                ItemFeature(featureName: "Белки/100 г", featureValue: "1,3 г"),
                                ItemFeature(featureName: "Углеводы/100 г", featureValue: "3,3 г"),
                            ]))
        ]
    }
    
    static func getProductFeedback() -> [MainTableViewRow] {
        [
            .feedback([
                FeedbackModel(userName: "1Александр В.",
                              feedbackDate: "7 мая 2021",
                              feedbackRate: 4,
                              feedbackText: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                FeedbackModel(userName: "2Александр В.",
                              feedbackDate: "7 мая 2021",
                              feedbackRate: 4,
                              feedbackText: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                FeedbackModel(userName: "3Александр В.",
                              feedbackDate: "7 мая 2021",
                              feedbackRate: 4,
                              feedbackText: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                FeedbackModel(userName: "4Александр В.",
                              feedbackDate: "7 мая 2021",
                              feedbackRate: 4,
                              feedbackText: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                FeedbackModel(userName: "5Александр В.",
                              feedbackDate: "7 мая 2021",
                              feedbackRate: 4,
                              feedbackText: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                FeedbackModel(userName: "6Александр В.",
                              feedbackDate: "7 мая 2021",
                              feedbackRate: 4,
                              feedbackText: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                FeedbackModel(userName: "7Александр В.",
                              feedbackDate: "7 мая 2021",
                              feedbackRate: 4,
                              feedbackText: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                FeedbackModel(userName: "8Александр В.",
                              feedbackDate: "7 мая 2021",
                              feedbackRate: 4,
                              feedbackText: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
                FeedbackModel(userName: "9Александр В.",
                              feedbackDate: "7 мая 2021",
                              feedbackRate: 4,
                              feedbackText: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"),
            ])
        ]
    }
}
