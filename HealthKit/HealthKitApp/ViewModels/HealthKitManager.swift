//
//  HealthKitManager.swift
//  HealthKit
//
//  Created by Arjun Saseendran on 08/06/26.
//

import SwiftUI
import HealthKit
import Combine

final class HealthKitManager: ObservableObject {
    static let shared = HealthKitManager()
    let healthStore = HKHealthStore()

    @Published var isAuthorized: Bool = false
    @Published var healthData: [HealthMetric : [HealthRecord]] = [:]
    @Published var isLoading: Bool = false

    init(){
        Task {
            await checkAndRequestAuthorization()
        }
    }

    func checkAndRequestAuthorization() async{
        guard HKHealthStore.isHealthDataAvailable() else {
            return
        }
        let typesToRead = Set(HealthMetric.allCases.map { $0.healthKitType})

        do {
            try await healthStore.requestAuthorization(toShare: [], read: typesToRead)
            await MainActor.run {
                isAuthorized = true
                Task {
                    await fetchAllData()
                }
            }
        }catch {
            print("Auth failed: \(error.localizedDescription)")
        }
    }

    func fetchAllData() async{

    }


}
