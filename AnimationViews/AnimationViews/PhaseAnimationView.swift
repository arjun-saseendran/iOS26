//
//  NormalAnimationView.swift
//  AnimationViews
//
//  Created by Arjun Saseendran on 30/05/26.
//

import SwiftUI

struct PhaseAnimationView: View {
    @State private var animate = false
    var body: some View {
        NavigationStack {
            VStack {
                Circle()
                    .fill(.red.gradient)
                Circle()
                    .fill(.orange.gradient)
                Circle()
                    .fill(.green.gradient)
            }

            .navigationTitle("Trafic Light")
            .onTapGesture {

                animate.toggle()

            }
            .phaseAnimator([1.0, 0.5], trigger: animate){ view, phase in
                view
                    .scaleEffect(phase)
                    .opacity(phase)

            }
        }
    }
}

#Preview {
    PhaseAnimationView()
}
