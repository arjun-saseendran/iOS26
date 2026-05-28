//
//  ContentView.swift
//  RefreshableModifier
//
//  Created by Arjun Saseendran on 28/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var randomData = Array(0..<5)
    var body: some View {
        NavigationStack {
            List {
                ForEach(randomData, id: \.self) { item in
                    Text("Item: \(item)")
                }
            }
            .navigationTitle("Async Api Call")
            .refreshable {
                await fetchData()
            }
        }
    }

    private func fetchData() async {
        do {
            let (_, _) = try await URLSession.shared.data(
                from:
                    URL(string: "https://httpbin.org/delay/5")!
            )
            randomData.append(Int.random(in: 10...1000))
        } catch {
            print("error: \(error.localizedDescription)")
        }
        //        try? await Task.sleep(for: .seconds(2))
        //        randomData.append(Int.random(in: 10...1000))
    }
}

#Preview {
    ContentView()
}
