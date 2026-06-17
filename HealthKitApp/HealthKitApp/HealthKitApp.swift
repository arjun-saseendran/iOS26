//
//  HealthKitApp.swift
//  HealthKit
//
//  Created by Arjun Saseendran on 08/06/26.
//

import SwiftUI

@main
struct HealthKitApp: App {
    @StateObject private var healthKit = HealthKitManager.shared
    var body: some Scene {
        WindowGroup {
            if !healthKit.isAuthorized {
                PermissionsView()
            } else {
                ContentView()
            }
        }
    }
}
