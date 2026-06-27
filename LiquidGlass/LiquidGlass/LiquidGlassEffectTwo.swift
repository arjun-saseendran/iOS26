//
//  LiquidGlassEffectTwo.swift
//  LiquidGlass
//
//  Created by Arjun Saseendran on 27/06/26.
//
import SwiftUI

struct LiquidGlassEffectTwo: View {
    @Namespace private var namespace
    @State private var isExpanded = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            GlassEffectContainer(spacing: 60) {
                VStack(alignment: .center, spacing: 20) {
                    if isExpanded {
                        Image(systemName: "folder.fill.badge.plus")
                            .frame(width: 80, height: 80)
                            .font(.system(size: 36))
                            .glassEffect(.clear)
                            .glassEffectID("newFolder", in: namespace)
                        Image(
                            systemName: "pencil.tip.crop.circle.badge.plus.fill"
                        )
                        .frame(width: 80, height: 80)
                        .font(.system(size: 36))
                        .glassEffect(.clear)
                        .glassEffectID("pencle", in: namespace)
                        Image(systemName: "widget.small.badge.plus")
                            .frame(width: 80, height: 80)
                            .font(.system(size: 36))
                            .glassEffect(.clear)
                            .glassEffectID("pencil", in: namespace)
                        Image(systemName: "person.crop.circle.fill.badge.plus")
                            .frame(width: 80, height: 80)
                            .font(.system(size: 36))
                            .glassEffect(.clear)
                            .glassEffectID("pencil", in: namespace)

                    }
                    Button{
                        withAnimation(.interactiveSpring(duration: 2, extraBounce: 0.5)){
                            isExpanded.toggle()
                        }

                    }label: {

                        Image(systemName: isExpanded ? "xmark" : "line.3.horizontal")
                            .frame(width: 80, height: 80)
                            .font(.system(size: 36))
                            .rotationEffect(.degrees(isExpanded ? 0 : 180))
                            .glassEffect(.clear)
                            .glassEffectID("closeButton", in: namespace)
                    }

                }
            }
            .padding(.trailing)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .background {
                Image(.bg)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .blur(radius: isExpanded ? 10 : 0)
        }

        }
    }
}

#Preview {
    LiquidGlassEffectTwo()
}
