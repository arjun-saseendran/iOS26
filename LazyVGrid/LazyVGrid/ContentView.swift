//
//  ContentView.swift
//  LazyVGrid
//
//  Created by Arjun Saseendran on 28/05/26.
//

import SwiftUI

struct ContentView: View {
    let columns = [GridItem(.fixed(50)), GridItem(.fixed (50)), GridItem(.fixed(50))]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns){
                ForEach(0...50, id: \.self){ img in
                    Image(systemName: "\(img).circle.fill")
                        .font(.largeTitle)
                        .background(.orange)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
