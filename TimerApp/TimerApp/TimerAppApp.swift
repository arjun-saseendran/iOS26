//
//  TimerAppApp.swift
//  TimerApp
//
//  Created by Arjun Saseendran on 05/06/26.
//

import SwiftUI

@main
struct TimerAppApp: App {
    @StateObject var viewModel = TimerViewModel()
    @Environment(\.scenePhase) var scene
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .onChange(of: scene) { _, newValue in
                    #if !targetEnvironment(simulator)
                        if newValue == .background {
                            viewModel.leftTime = Date()
                            print("App entered background")
                        }

                        if newValue == .active && viewModel.leftTime != nil {
                            let diffInTime = Date().timeIntervalSince(
                                viewModel.leftTime
                            )
                            let currentTime =
                                viewModel.selectedTime - Int(diffInTime)
                            print("Diff Time:", diffInTime)
                            print("Current Time:", currentTime)

                            if currentTime >= 0 {
                                withAnimation(.default) {
                                    viewModel.selectedTime = currentTime
                                }

                            } else {
                                viewModel.resetView()
                            }
                        }

                    #endif
                }
        }
    }
}
