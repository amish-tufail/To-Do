//
//  ListViewModel.swift
//  To-Do
//
//  Created by Amish on 16/04/2024.
//

import Foundation
import Observation

@Observable
class ListViewModel {
    let itemsKey = "items_list"
    var items: [ItemModel] = [] { // When changes didSet gets call
        didSet {
            saveItems()
        }
    }
    init() {
        getItems()
    }
    
    private func getItems() {
//        let newItems = [
//            ItemModel(title: "This is the first title!", isCompleted: false),
//            ItemModel(title: "Second title!", isCompleted: true),
//            ItemModel(title: "Third title!", isCompleted: false)
//         ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItems
    }
    
    func onDelete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func onMove(indices: Int, newOffset: IndexSet) {
        items.move(fromOffsets: newOffset, toOffset: indices)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion() // return ItemModel
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
