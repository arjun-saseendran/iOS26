//
//  HealthRecord.swift
//  HealthKit
//
//  Created by Arjun Saseendran on 08/06/26.
//

import Foundation

struct HealthRecord: Identifiable {
    let id = UUID()
    let date: Date
    var value: Double
}
