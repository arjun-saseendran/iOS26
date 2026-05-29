//
//  ContentView.swift
//  CounterApp
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var isEnable = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Counter: \(count)")

                HStack {
                    Button(
                        action: increment,
                        label: {
                            buttonBody(isUp: true)

                        }
                    )

                    Button(
                        action: decrement,
                        label: {
                            buttonBody(isUp: false)

                        }
                    ).disabled(!isEnable)

                }

            }

        }
    }

    private func increment() {
        count += 1
    }

    private func decrement() {
        count -= 1
    }

    @ViewBuilder
    func buttonBody(isUp: Bool) -> some View {
        VStack {
            Image(systemName: "arrowtriangle.\(isUp ? "up" : "down").fill")
            Text("Tap to up")
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            isUp ? .blue : .orange,
            in: .rect(cornerRadius: 5)

        )

    }
}

#Preview {
    ContentView()
}
