//
//  ContentView.swift
//  OnboardingApp
//
//  Created by Arjun Saseendran on 22/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var presentOnboardingFlow: Bool = false
    var body: some View {
        HomeView()
            .sheet(isPresented: $presentOnboardingFlow) {
                OnboardingView(steps: OnboardingStep.sampleSteps){
                    presentOnboardingFlow = false
                }
                .interactiveDismissDisabled(true)
            }
            .onAppear {
                presentOnboardingFlow = true
            }
    }
}

#Preview {
    ContentView()
}
