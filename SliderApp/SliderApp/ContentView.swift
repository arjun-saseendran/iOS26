//
//  ContentView.swift
//  SliderApp
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var tipAmount = 0.0
    var body: some View {
        VStack {
           Text("Set Tip Amount")
            Text("Tip \(tipAmount.formatted(.currency(code: "inr")))")
            Slider(value: $tipAmount, in: 5...100, step: 5)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
