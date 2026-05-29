//
//  GeometryTwo.swift
//  GeometryReader
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct GeometryTwo: View {
    var body: some View {
        VStack{
            Text("Coordinator Spaces")
                .font(.headline)
                .padding()
            ZStack{
                Color.gray.opacity(0.2)
                GeometryReader { geometry in


                Rectangle()
                    .foregroundStyle(LinearGradient(colors: [.orange, .pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                VStack(alignment: .leading){
                    Text("Local: \(geometryString(geometry.frame(in: .local)))")
                    Text("Global: \(geometryString(geometry.frame(in: .global)))")
                }
                .position(x: geometry.size.width/2, y: geometry.size.height/2)
                .font(.caption.bold())
                .foregroundStyle(.white)

            }
            }.frame(height: 300)
        }
    }

    func geometryString(_ frame: CGRect) -> String {
        "x: \(Int(frame.origin.x)), y: \(Int(frame.origin.y)), w: \(Int(frame.size.width)), \(Int(frame.size.height))"
    }
}

#Preview {
    GeometryTwo()
}
