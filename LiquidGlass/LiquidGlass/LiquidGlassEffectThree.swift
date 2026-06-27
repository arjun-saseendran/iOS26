//
//  LiquidGlassEffectThree.swift
//  LiquidGlass
//
//  Created by Arjun Saseendran on 27/06/26.
//
import SwiftUI

struct AnimateMacro: View {
    @State private var expand = false
    var body: some View {
        NavigationStack {
            VStack {
                CircleShape(
                    radius: expand ? 100 : 10,
                    startAngle: expand ? 180 : 10,
                    endAngle: expand ? 360 : 180,
                    isClockWise: true
                )
                .stroke(.blue.gradient, lineWidth: 20)
                //                    .scaleEffect(expand ? 1 : 0.3)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.smooth) {
                        expand.toggle()
                    }
                }

            }
            .navigationTitle("iOS Developer")
        }

    }
}

#Preview {
    AnimateMacro()
}

//struct CircleShape: Shape {
//    var radius: CGFloat
//    var startAngle: Double
//    var animatableData: AnimatablePair <CGFloat, Double> {
//        get { AnimatablePair(radius, startAngle) }
//        set { radius = newValue.first
//            startAngle = newValue.second }
//    }
//    func path(in rect: CGRect) -> Path {
//        Path { path in
//
//            path.addArc(
//                center: .init(x: rect.midX, y: rect.midY),
//                radius: radius,
//                startAngle: .zero,
//                endAngle: .init(
//                    degrees: startAngle
//                ),
//                clockwise: false
//            )
//
//        }
//    }
//}

@Animatable
@MainActor
struct CircleShape: Shape {
    var radius: CGFloat
    var startAngle: Double
    var endAngle: Double
    @AnimatableIgnored var isClockWise: Bool

    nonisolated func path(in rect: CGRect) -> Path {
        Path { path in

            path.addArc(
                center: .init(x: rect.midX, y: rect.midY),
                radius: radius,
                startAngle: .degrees(startAngle),
                endAngle: .degrees(endAngle),
                clockwise: isClockWise
            )

        }
    }
}
