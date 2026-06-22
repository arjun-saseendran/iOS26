//
//  OnboardingSteps.swift
//  OnboardingApp
//
//  Created by Arjun Saseendran on 22/06/26.
//

import Foundation
import SwiftUI


struct OnboardingSteps: Identifiable, Equatable{
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let accentColor: Color

    static func == (lhs: OnboardingSteps, rhs: OnboardingSteps) -> Bool {
        lhs.id == rhs.id
    }

}



