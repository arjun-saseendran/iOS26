//
//  ContentView.swift
//  Overlay
//
//  Created by Arjun Saseendran on 27/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.image)
                .resizable()
                .frame(height: 600)
                .clipped()
                .overlay{
                    Rectangle()
                        .opacity(0.6)
                }
                .overlay{
                    Text("Sweet Home")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                }
                
            
        }
        
    }
}

#Preview {
    ContentView()
}
