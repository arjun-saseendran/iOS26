//
//  ContentView.swift
//  ScrollView
//
//  Created by Arjun Saseendran on 28/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 15){
Text("iOS Developer")
                    .font(.largeTitle)
                ForEach(0..<30){ ids in
                    Text("Title \(ids)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.mint.opacity(0.2), in:
                        RoundedRectangle(cornerRadius: 20))

                }
            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
