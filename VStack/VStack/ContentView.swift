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
           Text("Swift")
                .foregroundStyle(.orange)
            Text("iOS Developer")
            Text("iOS26")
        }
        .foregroundStyle(.secondary)
        .border(.black)
        
    }
}

#Preview {
    ContentView()
}
