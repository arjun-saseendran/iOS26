//
//  ContentView.swift
//  ColorMixerApp
//
//  Created by Arjun Saseendran on 25/05/26.
//

import SwiftUI

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


struct ColorMixerView: View{
    @State private var red: Double = 0.5
    @State private var green: Double = 0.5
    @State private var blue: Double = 0.5
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: red, green: green, blue: blue ))
                
                Text("Color Preview")
                    .foregroundStyle(.white)
                    .bold()
                    .shadow(radius: 5)
                    
                
            }
            VStack(spacing: 20){
                
            }
        }
    }
}
