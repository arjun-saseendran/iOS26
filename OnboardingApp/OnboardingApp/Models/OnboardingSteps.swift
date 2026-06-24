//
//  OnboardingSteps.swift
//  OnboardingApp
//
//  Created by Arjun Saseendran on 22/06/26.
//

import Foundation
import SwiftUI


struct OnboardingStep: Identifiable, Equatable{
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let accentColor: Color

    static func == (lhs: OnboardingStep, rhs: OnboardingStep) -> Bool {
        lhs.id == rhs.id
    }

}

extension OnboardingStep {
    static let sampleSteps: [OnboardingStep] = [
        OnboardingStep(imageName: "food1", title: "Choose Your Favorite Menu", description: "Discover delicious options tailored to your preferences and dietary needs.", accentColor: .blue),
        OnboardingStep(imageName: "food2", title: "Find Best Price and Deals", description: "Discover delicious options tailored to your preferences and dietary needs.", accentColor: .yellow),
        OnboardingStep(imageName: "food3", title: "Fast Delivery Items", description: "Discover delicious options tailored to your preferences and dietary needs.", accentColor: .pink)
    ]
}

