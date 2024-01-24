//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Selman Adanır on 18.12.2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [ItemModel(title: "This is the first title!", isCompleted: false),
                        ItemModel(title: "This is the second title!", isCompleted: true),
                        ItemModel(title: "This is the third title!", isCompleted: false)]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { existingItem in
            existingItem.id == item.id
        }) {
            items[index].isCompleted.toggle()
        }
    }
}
