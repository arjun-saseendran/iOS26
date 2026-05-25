//
//  ContentView.swift
//  Zstack
//
//  Created by Arjun Saseendran on 25/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .fill(.indigo)
                .frame(width: 100, height: 100)
            Rectangle()
                .fill(.yellow)
                .frame(width: 70, height: 70)
            Rectangle()
                .fill(.blue)
                .frame(width: 40, height: 40)
        }
        
        
    }
}

#Preview {
    ContentView()
}
