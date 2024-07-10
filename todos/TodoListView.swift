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
    
    init(searchText: String, sortDescriptor: SortDescriptor<Todo>) {
        _todos = Query(filter: #Predicate { todo in
            if searchText.isEmpty {
                return true
            } else {
                return todo.title.localizedStandardContains(searchText)
            }
        }, sort: [sortDescriptor])
    }
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                NavigationLink(value: todo) {
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .font(.headline)
                        HStack {
                            Text(todo.dueDate.formatted(date: .long, time: .shortened))
                            Spacer()
                            Text("\(todo.priority)")
                        }
                        .font(.caption)
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
    TodoListView(searchText: "", sortDescriptor: SortDescriptor(\Todo.title, order: .reverse))
}
