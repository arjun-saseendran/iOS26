//
//  HealthMetric.swift
//  HealthKit
//
//  Created by Arjun Saseendran on 08/06/26.
//

import Foundation
import HealthKit
import SwiftUI

enum HealthMetric: String, CaseIterable {
    case calories = "Calories"
    case steps = "Steps"
    case sandHours = "Sand Hours"
    case excerciseMinutes = "Excercise Minutes"
    case hertRate = "Heart Rate"
    case flightsClimbed = "Flights Climbed"

    var systemImage: String {
        switch self {
        case .calories: return "flame.fill"
        case .steps: return "figure.walk"
        case .sandHours: return "figure.stand"
        case .excerciseMinutes: return "heart.circle.fill"
        case .hertRate: return "waveform.path.ecg"
        case .flightsClimbed: return "figure.stairs"

        }
    }
}
