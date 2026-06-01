//
//  ContentView.swift
//  TodoAppSwiftData
//
//  Created by Arjun Saseendran on 01/06/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var todos: [ToDo]
    var body: some View {
        NavigationStack{
            List {
                ForEach(todos) { todo in
                    Text(todo.title)
                        .font(.title)
                        .strikethrough(todo.isCompleted, pattern: .dash, color: .red)
                }
            }
            .navigationTitle("Todo List")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(ToDo.mock)
}
