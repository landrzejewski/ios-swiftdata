//
//  TodoFormView.swift
//  todos
//
//  Created by Łukasz Andrzejewski on 10/07/2024.
//

import SwiftUI
import SwiftData

struct TodoFormView: View {
    
    @Bindable var todo: Todo
    
    var body: some View {
        Form {
            TextField("Title", text: $todo.title)
            DatePicker("Due date", selection: $todo.dueDate)
            Section("Priority") {
                Picker("Priority", selection: $todo.priority) {
                    Text("Low").tag(1)
                    Text("Standard").tag(2)
                    Text("High").tag(3)
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Edit todo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Todo.self, configurations: config)
    let todo = Todo(title: "Learn SwiftUI")
    return TodoFormView(todo: todo).modelContainer(container)
}
