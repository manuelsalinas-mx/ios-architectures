//
//  NoteViewModel.swift
//  todo-mvvm
//
//  Created by Manuel Salinas on 1/11/24.
//

import Foundation
import SwiftUI
import Observation

@Observable
class NoteViewModel {
    var notes: [NoteModel] = []

    init() {
        notes = getNotes()
    }

    func saveNote(description: String) {
        guard !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }

        let new = NoteModel(title: description)
        notes.insert(new, at: 0)

        encodeAndSaveNotes()
    }

    private func encodeAndSaveNotes() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: "notes")
        }
    }

    func getNotes() -> [NoteModel] {
        if let data = UserDefaults.standard.object(forKey: "notes") as? Data {
            if let notes = try? JSONDecoder().decode([NoteModel].self, from: data) {
                return notes
            }
        }

        return []
    }

    func removeNote(with id: String) {
        notes.removeAll(where: { $0.id == id})
        encodeAndSaveNotes()
    }

    func updateFavoriteNote(note: Binding<NoteModel>) {
        note.wrappedValue.isFavorite = !note.wrappedValue.isFavorite
        encodeAndSaveNotes()
    }

    func getNumberOfNotes() -> String {
        notes.count.description
    }
}

