//
//  ContentView.swift
//  LazyVStack
//
//  Created by Arjun Saseendran on 27/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(0...100, id: \.self){ _ in
                    Text(Date().formatted(date: .omitted, time: .standard))
                        .font(.largeTitle)
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
