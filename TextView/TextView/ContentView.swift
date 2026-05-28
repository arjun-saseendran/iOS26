//
//  ContentView.swift
//  TextView
//
//  Created by Arjun Saseendran on 28/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {

            Text(Date()...Date().addingTimeInterval(10000))
            Text(Date(), style: .timer)
                .font(.largeTitle)

        }
    }
}
#Preview {
    ContentView()
}
