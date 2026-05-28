//
//  ContentView.swift
//  TodoApp
//
//  Created by Arjun Saseendran on 28/05/26.
//

import SwiftUI

struct ContentView: View {
    @State var tasks: [String] = ["Wash car", "Learn iOS", "Build Project"]
    @State var newTask: String = ""
    var body: some View {
        NavigationStack{
            HStack{
                TextField("Add new task", text: $newTask)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
                Button(action: addTask){
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundStyle(Color.blue)
                }
                .padding(.trailing)
            }.padding()
            List{
                ForEach(tasks, id: \.self) {task in
Text(task)
                }.onDelete(perform: deleteTask(at:))
            }.navigationTitle("Todo List")
        }
    }

    func addTask(){
        if !newTask.isEmpty{
            tasks.append(newTask)
            newTask = ""

        }
    }

    func deleteTask(at offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
