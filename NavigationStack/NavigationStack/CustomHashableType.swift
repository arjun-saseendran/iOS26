//
//  CustomHashableType.swift
//  NavigationStack
//
//  Created by Arjun Saseendran on 31/05/26.
//

import SwiftUI

struct User: Hashable, Identifiable {
    let id = UUID()
    var name: String

}

extension User {
    static var sample: [User] {
        [.init(name: "Devika"), .init(name: "Maria"), .init(name: "Anju")]
    }
}

struct CustomHashableType: View {
    var body: some View {
        NavigationStack{
            List(User.sample) { person in
                NavigationLink(person.name, value: person)
            }
            .listStyle(.plain)
            .navigationTitle("Users")
            .navigationDestination(for: User.self){ person in
                PersonView(name: person.name)
            }
        }
    }
}

#Preview {
    CustomHashableType()
}


struct PersonView: View {
    var name: String
    var body: some View {
        Text("Name: \(name)")
    }
}
