//
//  ItemModel.swift
//  ToDoList
//
//  Created by Selman Adanır on 17.12.2023.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    let title: String
    var isCompleted: Bool
}
