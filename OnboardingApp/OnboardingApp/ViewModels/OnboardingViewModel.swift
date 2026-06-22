//
//  OnboardingViewModel.swift
//  OnboardingApp
//
//  Created by Arjun Saseendran on 22/06/26.
//

import Foundation
import Observation
import SwiftUI

@MainActor
@Observable
final class OnboardingViewModel {
    var currentIndex: Int? = 0
    var screenSize: CGSize = .zero

    let steps: [OnboardingStep]
    private let onboardingCompletion: () -> Void

    init(steps: [OnboardingStep], onComplete: @escaping () -> Void = {}) {
        self.steps = steps
        self.onboardingCompletion = onComplete
    }

    var isLastStep: Bool {
        guard let currentIndex = currentIndex else { return false }
        return currentIndex >= steps.count - 1
    }

    var currentSteps: OnboardingStep {
        guard let currentIndex = currentIndex else {
            return steps.first!
        }
        return steps[safe: currentIndex] ?? steps.first!
    }

    func updateScreenSize(_ size: CGSize) {
        self.screenSize = size
    }

    func updateCurrentIndex(_ index: Int) {
        guard index >= 0 && index < steps.count else { return }
        if index != currentIndex {
            currentIndex = index
        }
    }
    func navigationToNext() {
        guard !isLastStep else {
            completeOnboarding()
            return
        }

        let current = currentIndex ?? 0
        let nextIndex = min(current + 1, steps.count - 1)
        withAnimation(.easeInOut(duration: 0.3)) {
            currentIndex = nextIndex
        }
    }

    private func completeOnboarding() {
        onboardingCompletion()
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
