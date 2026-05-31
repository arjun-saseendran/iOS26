//
//  ContentView.swift
//  iOSNewsApp
//
//  Created by Arjun Saseendran on 31/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("iOS Developer")
            .task {
               print(await News.fetchNews())
            }


    }
}

#Preview {
    ContentView()
}
