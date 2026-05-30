//
//  CharView.swift
//  AnimationViews
//
//  Created by Arjun Saseendran on 30/05/26.
//

import SwiftUI

struct CharView: View {
    @State private var animate = false
    var array = ["i","p","h","o","n", "e", "13"]

    var body: some View {
        NavigationStack {
            PhaseAnimator(array, trigger: animate) { char in
                ZStack{
                    Circle()
                        .fill(.orange.gradient.opacity(0.5))
                        .frame(width: 200)

                    Image(systemName: char.lowercased())
                        .symbolVariant(.circle)
                        .font(.system(size: 200))
                        .foregroundStyle(.indigo.gradient)
                }

            }
            animation: { char in
                switch char {
                case "i": .bouncy.speed(0.2)
                case "p": .easeIn.speed(0.3)
                case "h": .easeInOut.speed(0.1)
                case "o": .easeOut.speed(0.2)
                case "n": .spring.speed(0.3)
                case "e": .snappy.speed(0.1)
                case "13": .smooth.speed(0.2)
                default: .bouncy
                }


            }
            .onTapGesture {
                animate.toggle()
            }
        }

    }
}

#Preview {
    CharView()
}
