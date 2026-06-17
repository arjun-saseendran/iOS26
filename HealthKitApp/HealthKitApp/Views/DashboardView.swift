//
//  DashboardView.swift
//  HealthKit
//
//  Created by Arjun Saseendran on 08/06/26.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var healthKit = HealthKitManager.shared
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(HealthMetric.allCases, id: \.self) { metric in
                        NavigationLink(destination: MetricDetailView(metric: metric)){
                            MetricCardView(metric: metric)
                        }

                    }
                }
                .padding()
            }
            .navigationTitle("Health Dashboard")
            .refreshable {
                await healthKit.fetchAllData()
            }
            .overlay {
                if healthKit.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.ultraThinMaterial)
                }
            }

        }
    }
}

#Preview {
    DashboardView()
}
