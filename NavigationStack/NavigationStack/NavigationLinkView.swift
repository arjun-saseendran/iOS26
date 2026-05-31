//
//  NavigationLinkView.swift
//  NavigationStack
//
//  Created by Arjun Saseendran on 31/05/26.
//

import SwiftUI

struct NavigationLinkView: View {
    @State private var count = 0
    //    @State private var triggerNavigation = false
    @State private var selected: Int? = nil
    var body: some View {
        NavigationView {
            VStack {
                Text("iOS Developer")
                    .font(.largeTitle)
                Button("Increase Count") {
                    count += 1
                }
                .buttonStyle(.bordered)
                //                NavigationLink{
                //                    Text("Wecome to iOS Developement")
                //                    NavigationDestinationView(count: count)
                //
                //                } label: {
                //                    Label("Click me", systemImage: "computermouse")
                //                }
                //                NavigationLink(
                //                    "Click me",
                //                    destination: NavigationDestinationView(count: count),
                //                    isActive: $triggerNavigation
                //                )
                //                .padding()
                //
                //                Button("Trigger Navigation") {
                //                    triggerNavigation.toggle()
                //                }
                //                .buttonStyle(.borderedProminent)
                VStack {
                    NavigationLink(
                        "View 1",
                        destination: DestView(title: "View One")
                            .navigationBarBackButtonHidden(),
                        tag: 1,
                        selection: $selected
                    )
                    NavigationLink(
                        "View 2",
                        destination: Text("View Two"),
                        tag: 2,
                        selection: $selected
                    )
                    NavigationLink(
                        "View 3",
                        destination: Text("View Three"),
                        tag: 3,
                        selection: $selected
                    )
                }
                .buttonStyle(.glass)
                .padding()
                HStack {
                    Button("Trigger 1") {
                        selected = 1
                    }
                    Button("Trigger 2") {
                        selected = 2
                    }
                    Button("Trigger 3") {
                        selected = 3
                    }
                }
                .buttonStyle(.borderedProminent)
            }

            .navigationTitle("Welcome to iOS World")
        }
    }
}

struct NavigationDestinationView: View {
    var count: Int
    var body: some View {
        Text("Hello iOS Developer Count is \(count)")
            .navigationTitle("Hello iOS Developer")
    }
}

struct DestView: View {
    @Environment(\.dismiss) var dismiss
    var title: String
    var body: some View {
        Text(title)
            .font(.headline)
            .navigationBarBackButtonHidden()
            .onTapGesture {
                dismiss()
            }

    }
}

#Preview {
    NavigationLinkView()
}
