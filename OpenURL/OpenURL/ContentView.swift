//
//  ContentView.swift
//  OpenURL
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openURL) private var openURL
    var body: some View {
        Button("Click") {
            openURL(URL(string: "https://github.com/arjun-saseendran")!)
        }
    }
}

#Preview {
    ContentView()
}

struct ExternalLink: View {

    let url: URL
    let label: String
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button(label) {
            openURL(url)
        }
    }
}
