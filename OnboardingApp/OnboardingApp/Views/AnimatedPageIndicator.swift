//
//  AnimatedPageIndicator.swift
//  OnboardingApp
//
//  Created by Arjun Saseendran on 23/06/26.
//

import SwiftUI

struct AnimatedPageIndicator: View {
    let totalPages: Int
    let currentIndex: Int
    let indicatorSpacing: CGFloat = 12
    let indicatorHeight: CGFloat = 7
    let activeIndicatorWidth: CGFloat = 20
    let inactiveIndicatorWidth: CGFloat = 7

    var body: some View {
        HStack(spacing: indicatorSpacing) {
            ForEach(0..<totalPages, id: \.self) { index in
                Capsule()
                    .foregroundStyle(.white.gradient)
                    .frame(
                        width: currentIndex == index
                            ? activeIndicatorWidth : inactiveIndicatorWidth,
                        height: indicatorHeight
                    )
                    .animation(.easeInOut(duration: 0.3), value: currentIndex)
            }
        }
    }
}
