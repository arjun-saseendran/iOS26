//
//  NormalAnimationView.swift
//  AnimationViews
//
//  Created by Arjun Saseendran on 30/05/26.
//

import SwiftUI

struct NormalAnimationView: View {
@State private var animate = false
    var body: some View {
        NavigationStack {
            VStack{
                Circle()
                    .fill(.red.gradient)
                Circle()
                    .fill(.orange.gradient)
                Circle()
                    .fill(.green.gradient)
            }
            .scaleEffect(animate ? 1.0 : 0.5)
            .navigationTitle("Trafic Light")
            .onTapGesture {
                withAnimation{
                    animate.toggle()
                }
            }
        }
    }
}

#Preview {
    NormalAnimationView()
}
