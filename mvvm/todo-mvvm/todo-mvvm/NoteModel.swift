//
//  NoteModel.swift
//  todo-mvvm
//
//  Created by Manuel Salinas on 1/11/24.
//

import Foundation

struct NoteModel: Codable {
    let id: String
    var isFavorite: Bool
    let title: String

    init(id: String = UUID().uuidString, isFavorite: Bool = false, title: String) {
        self.id = id
        self.isFavorite = isFavorite
        self.title = title
    }
}
