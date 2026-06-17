//
//  MetricDetailView.swift
//  HealthKit
//
//  Created by Arjun Saseendran on 08/06/26.
//

import Charts
import SwiftUI

struct MetricDetailView: View {
    @StateObject var healthKit = HealthKitManager.shared
    let metric: HealthMetric
    @State private var selectedData: ChartData?

    var records: [HealthRecord] {
        healthKit.healthData[metric] ?? []

    }

    var body: some View {
        VStack {
            Chart(records) { record in

                BarMark(
                    x: .value("Date", record.date, unit: .day),
                    y: .value("Value", record.value)
                )
                .foregroundStyle(metric.color.gradient)
            }
            .frame(height: 200)
            .padding()
            .chartOverlay { proxy in
                GeometryReader { geo in

                }
            }

        }

    }
    private func findClosestRecord(
        at xPosition: CGFloat,
        proxy: ChartProxy,
        size: CGSize
    ) -> HealthRecord? {
        let plotwidth = size.width
        let barWidth = plotwidth / CGFloat(records.count)

        var closestRecord: HealthRecord?
        var minDistance: CGFloat = .infinity

        for record in records {
            guard let xPos = proxy.position(forX: record.date) else { continue }

            let barCenter = xPos + (barWidth / 2)
            let distance = abs(barCenter - xPosition)
            if distance < minDistance {
                minDistance = distance
                closestRecord = record
            }

        }
        return closestRecord
    }
}
