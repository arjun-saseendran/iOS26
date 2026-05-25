//
//  ContentView.swift
//  HStack
//
//  Created by Arjun Saseendran on 25/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Rectangle().overlay{
                Text("1")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
            
            Rectangle().overlay{
                Text("2")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
            Rectangle().overlay{
                Text("3")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
        }
    }
}

#Preview {
    ContentView()
}
