//
//  ContentView.swift
//  TodoAppSwiftData
//
//  Created by Arjun Saseendran on 01/06/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [ToDo]
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    ForEach(todos) { todo in
                        Text(todo.title)
                            .font(.title)
                            .strikethrough(todo.isCompleted, pattern: .dash, color: .red)
                    }
                }
                Button("Add New Todo"){
                    modelContext.insert(ToDo(title: "Leran DSA", isCompleted: false))
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
