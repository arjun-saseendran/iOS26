//
//  LiquidGlassEffectOne.swift
//  LiquidGlass
//
//  Created by Arjun Saseendran on 26/06/26.
//
import SwiftUI

struct LiquidGlassEffectOne: View {
    @Namespace private var namespace
    @State private var animate = false

    var body: some View {
        VStack {
            GlassEffectContainer(spacing: 10) {
                HStack {
                    Image(systemName: "sun.max.fill")
                        .padding()
                        .glassEffect(.clear)
                        .glassEffectID("sun.max.fill", in: namespace)
                    if animate {
                        Image(systemName: "moon.stars.fill")
                            .padding()
                            .glassEffect(.clear)
                            .glassEffectID("moon.stars.fill", in: namespace)
                        Image(systemName: "cloud.rain.fill")
                            .padding()
                            .glassEffect(.clear)
                            .glassEffectID("cloud.rain.fill", in: namespace)

                    }
                }
                Button("Animate"){
                    withAnimation(.bouncy(duration: 0.5)){
                        animate.toggle()
                    }
                }
                .controlSize(.large)
                .buttonStyle(.glassProminent)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Image(.bg)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

        }
    }
}

#Preview {
    LiquidGlassEffectOne()
}
