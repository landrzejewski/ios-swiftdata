//
//  Todo.swift
//  todos
//
//  Created by Łukasz Andrzejewski on 10/07/2024.
//

import Foundation
import SwiftData

@Model
final class Todo {
    
    var title: String
    var dueDate: Date
    var priority: Int
    
    init(title: String, dueDate: Date = .now, priority: Int = 2) {
        self.title = title
        self.dueDate = dueDate
        self.priority = priority
    }
    
}
