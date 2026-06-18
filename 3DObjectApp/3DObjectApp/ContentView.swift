//
//  ContentView.swift
//  3DObjectApp
//
//  Created by Arjun Saseendran on 18/06/26.
//

import SwiftUI

enum Item: String, Identifiable, CaseIterable {
    case chair = "chair"
    case gramophone = "gramophone"
    case guitar = "guitart"
    case tv = "tv"

    var id: String { self.rawValue }

    var icon: String {
        switch self {
        case .chair: return "🪑"
        case .gramophone: return "📻"
        case .guitar: return "🎸"
        case .tv: return "📺"
        }
    }

    var name: String {
        switch self {
        case .chair: return "Chair"
        case .gramophone: return "Gramophone"
        case .guitar: return "Guitar"
        case .tv: return "TV"
        }
    }
}

struct ContentView: View {

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
