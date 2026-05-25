//
//  ContentView.swift
//  VStack
//
//  Created by Arjun Saseendran on 25/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
           Text("Orange")
                .foregroundStyle(.orange)
            Text("Green")
            Text("Yellow")
        }
        .foregroundStyle(.secondary)
        .border(.black)
        
    }
}

#Preview {
    ContentView()
}
