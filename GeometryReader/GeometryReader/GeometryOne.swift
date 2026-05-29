//
//  ContentView.swift
//  GeometryReader
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct GeometryOne: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Width: \(Int(geometry.size.width))")
                    .font(.headline)
                Text("Height: \(Int(geometry.size.height))")
                    .font(.headline)
                Rectangle()
                    .foregroundStyle(LinearGradient(colors:[.orange, .pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(
                        width: geometry.size.width * 0.8,
                        height: geometry.size.height * 0.8

                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }
        .frame(height: 300)
        .border(Color.gray)
    }
}

#Preview {
   GeometryOne()
}
