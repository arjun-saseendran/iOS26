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
}
