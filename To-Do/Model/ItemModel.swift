//
//  ItemModel.swift
//  To-Do
//
//  Created by Amish on 16/04/2024.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(title: title, isCompleted: !isCompleted)
    }
}
