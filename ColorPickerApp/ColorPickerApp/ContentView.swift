//
//  ContentView.swift
//  ColorPickerApp
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var colorExample = Color.orange
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(colorExample)
                .overlay(
                    Text(colorExample.rgbaDescription)
                        .font(.custom("Jetbrains Mono", size: 24))
                        .foregroundStyle(.white)


                )
                .frame(height: 200)
            ColorPicker("Select color", selection: $colorExample, supportsOpacity: true)
//                .labelsHidden()

        }
        .padding()
    }
}

private extension Color {
    var rgbaDescription: String {
        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif
        var (r, g, b, a): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        let native = NativeColor(self)
        native.getRed(&r, green: &g, blue: &b, alpha: &a)
        let red = Int(r * 255)
        let green = Int(g * 255)
        let blue = Int(b * 255)
        return String(format: "R: %d, G: %d, B: %d, A: %.2f", red, green, blue, a)
    }
}

#Preview {
    ContentView()
}
