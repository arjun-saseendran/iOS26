//
//  ContentView.swift
//  ListViewTwo
//
//  Created by Arjun Saseendran on 28/05/26.
//

import SwiftUI

struct User: Identifiable {
let id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
  @State  private var users: [User] = [User(name: "Anju", age: 28), User(name: "Devika", age: 26), User(name: "Manjima", age: 33)]
    var body: some View {
        List {
            ForEach(users){ user in
                VStack(alignment: .leading){
                    Text("Name: \(user.name)")
                        .font(.title2)
                    Text("Age: \(user.age)")
                        .font(.title2)
                }
            }
            .onDelete(perform: delete(at:))
        }
        .navigationTitle("Users")


    }
    func delete(at offsets: IndexSet){
        print("Deleting: \(offsets)")
        users.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
