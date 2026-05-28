//
//  ContentView.swift
//  ListView
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
    @State private var users: [User] = [
        User(name: "Maria", age: 30), User(name: "Ansiba", age: 26),
        User(name: "Anusree", age: 22),
    ]

    var body: some View {
        List($users, editActions: .delete) { $user in
            VStack(alignment: .leading) {
                Text("Name: \(user.name)")
                Text("Age: \(user.age)")
            }
            .padding()

        }
    }
}

#Preview {
    ContentView()
}
