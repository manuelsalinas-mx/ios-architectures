//
//  ContentView.swift
//  todo-mvvm
//
//  Created by Manuel Salinas on 1/11/24.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var fieldFocused: Bool
    @State var descriptionNote: String = ""
    @State var notesViewModel = NoteViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Text("Write a new task")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .underline()
                    .foregroundStyle(.indigo)
                    .padding(.horizontal, 16)

                TextEditor(text: $descriptionNote)
                    .focused($fieldFocused)
                    .foregroundStyle(.gray)
                    .frame(height: 100)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.indigo, lineWidth: 2)
                    }
                    .padding(.horizontal, 12)
                    .cornerRadius(3)

                Button {
                    print("creating note...")
                    fieldFocused = false
                    notesViewModel.saveNote(description: descriptionNote)
                    descriptionNote = ""
                } label: {
                    Label("Create", systemImage: "square.and.arrow.down.fill")
                }
                .buttonStyle(.bordered)
                .tint(.indigo)

                Spacer()

                // Note List
                List($notesViewModel.notes, id: \.id) { $note in
                    HStack {
                        Text(note.title)

                        // Fav?
                        if note.isFavorite {
                            Spacer()
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button {
                            notesViewModel.updateFavoriteNote(note: $note)
                        } label: {
                            Label("Fav", systemImage: "star.fill")
                        }
                        .tint(.yellow)
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            notesViewModel.removeNote(with: note.id)
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                        .tint(.red)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.indigo.opacity(0.1))

            }
            .navigationTitle("To-Do")

            .toolbar {
                ToolbarItem {
                    Text(notesViewModel.getNumberOfNotes())
                        .font(.largeTitle)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
