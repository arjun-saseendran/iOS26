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
    var color: Color {
        switch self {
        case .calories: return .orange
        case .steps: return .blue
        case .sandHours: return .green
        case .excerciseMinutes: return .red
        case .hertRate: return .pink
        case .flightsClimbed: return .indigo
        }
    }
    var unit: String {
        switch self {
        case .calories: return "cal"
        case .steps: return "steps"
        case .sandHours: return "hrs"
        case .excerciseMinutes: return "min"
        case .hertRate: return "bpm"
        case .flightsClimbed: return "flights"
        }
    }
    var healthKitType: HKQuantityType {
        switch self {
        case .calories: return HKQuantityType(.activeEnergyBurned)
        case .steps: return HKQuantityType(.stepCount)
        case .sandHours: return HKQuantityType(.appleStandTime)
        case .excerciseMinutes: return HKQuantityType(.appleExerciseTime)
        case .hertRate: return HKQuantityType(.heartRate)
        case .flightsClimbed: return HKQuantityType(.flightsClimbed)
        }
    }
    var healthKitUint: HKUnit {
        switch self {
        case .calories: return .kilocalorie()
        case .steps: return .count()
        case .sandHours: return .hour()
        case .excerciseMinutes: return .minute()
        case .hertRate: return HKUnit.count().unitDivided(by: .minute())
        case .flightsClimbed: return .count()
        }
    }
    var statisticsOptions: HKStatisticsOptions {
        switch self {
        case .hertRate: return .discreteAverage
        default: return .cumulativeSum
        }
    }
}
