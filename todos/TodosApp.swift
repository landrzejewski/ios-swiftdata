//
//  TodosApp.swift
//  todos
//
//  Created by Łukasz Andrzejewski on 10/07/2024.
//

import SwiftUI
import SwiftData

@main
struct TodosApp: App {
    var body: some Scene {
        WindowGroup {
            TodosView()
        }
        .modelContainer(for: Todo.self)
    }
}
