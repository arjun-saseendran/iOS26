//
//  PendulamView.swift
//  AnimationViews
//
//  Created by Arjun Saseendran on 30/05/26.
//

import SwiftUI

struct PendulumView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Image(systemName: "clock.fill")
                    .resizable()
                    .foregroundStyle(.orange.gradient)
                    .frame(width: 200, height: 200)
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(width: 1, height: 150)
                    Circle()
                        .fill(.brown.gradient)
                        .frame(height: 20)
                }
                .phaseAnimator([45.0, -45.0]) { view, phase in
                    view.rotationEffect(.degrees(phase), anchor: .top)
                } animation: { _ in
                        .easeInOut.speed(0.2)
                }
            }
            .padding(25)
            .background(
                .indigo.gradient,
                in: RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 4)
            )
            .navigationTitle("Pendulum")
        }
    }
}

#Preview {
    PendulumView()
}
