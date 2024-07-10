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
    
    var body: some View {
        NavigationStack(path: $path) {
            TodoListView()
                .navigationDestination(for: Todo.self, destination: TodoFormView.init)
                .toolbar {
                    Button("Add") {
                        let todo = Todo(title: "")
                        context.insert(todo)
                        path = [todo]
                    }
                }
        }
    }
}

#Preview {
    TodosView()
}
