//
//  ContentView.swift
//  Binding
//
//  Created by Arjun Saseendran on 25/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.0
    var body: some View {
        VStack{
            ProgressView(value: progress)
                .padding()
            SlideView(progress: $progress)
        }.padding()
    }
}

struct SlideView: View {
    @Binding var progress: Double
    var body: some View {
        Slider(value: $progress, in: 0...1)
    }
}

#Preview {
    ContentView()
}
