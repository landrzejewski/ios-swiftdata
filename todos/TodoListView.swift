//
//  TodoListView.swift
//  todos
//
//  Created by Łukasz Andrzejewski on 10/07/2024.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    
    @Environment(\.modelContext) var context
    @Query var todos: [Todo]
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                NavigationLink(value: todo) {
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .font(.title)
                        Text(todo.dueDate.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteTodo)
        }
        .navigationTitle("Todos")
    }
    
    private func deleteTodo(_ indexSet: IndexSet) {
        indexSet.forEach {
            let todo = todos[$0]
            context.delete(todo)
        }
    }
}

#Preview {
    TodoListView()
}
