//
//  ContentView.swift
//  LazyHGrid
//
//  Created by Arjun Saseendran on 28/05/26.
//

import SwiftUI

struct ContentView: View {
    let rows = [GridItem(.adaptive(minimum: 50)), GridItem(.fixed(50))]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(1...50, id: \.self) { index in
                    Image(systemName: "\(index).circle.fill")
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
