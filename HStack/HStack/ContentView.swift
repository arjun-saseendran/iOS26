//
//  ContentView.swift
//  HStack
//
//  Created by Arjun Saseendran on 25/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(spacing: 5) {
           Text("iPhone")
            Text("Macbook Pro")
                .font(.largeTitle)
                .lineLimit(1)
                .layoutPriority(1)
                .foregroundStyle(.indigo)
                .shadow(color:.gray, radius: 5, x: 5, y: 5)
            Text("AirPods")
            Text("iPad")
            Text("Apple Watch")
        }
    }
}

#Preview {
    ContentView()
}
