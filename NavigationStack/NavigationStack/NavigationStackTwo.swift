//
//  NavigationStackTwo.swift
//  NavigationStack
//
//  Created by Arjun Saseendran on 30/05/26.
//

import SwiftUI

struct Colors: Identifiable, Hashable {
    let id = UUID()
    var title: String
}

extension Colors {
    static var exampleData: [Colors] {
        return [

            .init(title: "It is red color"),
            .init(title: "It is blue color"),
            .init(title: "It is green color"),
            .init(title: "It is orange color"),
            .init(title: "It is indigo color"),
            .init(title: "It is mint color"),

        ]
    }
}

struct NavigationStackTwo: View {
//    @State private var path = NavigationPath()
    @State private var path: [Colors] = [Colors.exampleData[0], Colors.exampleData[1], Colors.exampleData[2]]
    var body: some View {
        NavigationStack(path: $path) {
            List(Colors.exampleData) { col in
                NavigationLink(col.title, value: col)

            }
            .navigationTitle("Colors")
            .navigationDestination(for: Colors.self){ data in
                Text(data.title)
            }
        }
    }
}

#Preview {
    NavigationStackTwo()
}
