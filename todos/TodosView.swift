//
//  ContentView.swift
//  todos
//
//  Created by Łukasz Andrzejewski on 10/07/2024.
//

import SwiftUI

struct TodosView: View {
    
    @Environment(\.modelContext) var context
    @State private var path = [Todo]()
    @State private var searchText = ""
    @State private var sortDescriptor = SortDescriptor(\Todo.dueDate, order: .reverse)
    
    var body: some View {
        NavigationStack(path: $path) {
            TodoListView(searchText: searchText, sortDescriptor: sortDescriptor)
                .navigationDestination(for: Todo.self, destination: TodoFormView.init)
                .searchable(text: $searchText)
                .toolbar {
                    Button("Add") {
                        let todo = Todo(title: "")
                        context.insert(todo)
                        path = [todo]
                    }
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortDescriptor) {
                            Text("Title").tag(SortDescriptor(\Todo.title))
                            Text("Priority (desc)").tag(SortDescriptor(\Todo.priority, order: .reverse))
                            Text("Priority (asc)").tag(SortDescriptor(\Todo.priority))
                            Text("Due date").tag(SortDescriptor(\Todo.dueDate, order: .reverse))
                        }
                    }
                }
        }
    }
}

#Preview {
    TodosView()
}
