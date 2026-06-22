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



