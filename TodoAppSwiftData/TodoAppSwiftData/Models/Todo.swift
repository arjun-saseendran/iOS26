//
//  Todo.swift
//  TodoAppSwiftData
//
//  Created by Arjun Saseendran on 01/06/26.
//
import Foundation
import SwiftData

@Model
final class ToDo {
    var title: String
    var isCompleted: Bool

    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

extension ToDo {
    @MainActor
    static var mock: ModelContainer {
        let container = try! ModelContainer(
            for: ToDo.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        container.mainContext.insert(
            ToDo(title: "Learn iOS Development", isCompleted: false)
        )
        container.mainContext.insert(
            ToDo(title: "Learn Go Backend Developement", isCompleted: false)
        )
        container.mainContext.insert(
            ToDo(title: "Learn English Language", isCompleted: true)
        )
        return container
    }
}
