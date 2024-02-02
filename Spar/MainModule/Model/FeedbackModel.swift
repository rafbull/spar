//
//  FeedbackModel.swift
//  Spar
//
//  Created by Rafis on 01.02.2024.
//

import Foundation

// MARK: - Feedback Cell Model
struct FeedbackModel: Hashable {
    let id = UUID()
    let userName: String
    let feedbackDate: String
    let feedbackRate: Int
    let feedbackText: String
}
