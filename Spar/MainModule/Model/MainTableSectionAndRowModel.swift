//
//  MainTableSectionAndRowModel.swift
//  Spar
//
//  Created by Rafis on 31.01.2024.
//

import Foundation

// MARK: - Table Section and Table Row Models

// Section Model
enum MainTableViewSections {
    case item
    case feedback
}

// Row Model
enum MainTableViewRow: Hashable {
    case item(ItemModel)
    case feedback([FeedbackModel])
}
