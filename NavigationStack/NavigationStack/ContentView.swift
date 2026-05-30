//
//  ContentView.swift
//  NavigationStack
//
//  Created by Arjun Saseendran on 30/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink("Red", value: "Red Color")
                NavigationLink("Green", value: "Green Color")
                NavigationLink("Blue", value: "Blue Color")
                NavigationLink("Red Box", value: Color.red)
            }
            .navigationTitle("Colors")
            .navigationDestination(for: String.self) { value in
                Text(value)
                NavigationLink("Inside", value: "Inside the other link")
                Button("Home") {
                    path = NavigationPath()
                }
                .buttonStyle(.glassProminent)
            }
            .navigationDestination(for: Color.self) { value in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(value)

            }
        }
    }
}


#Preview {
    ContentView()
}
