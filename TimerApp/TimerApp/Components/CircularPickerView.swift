//
//  CircularPickerView.swift
//  TimerApp
//
//  Created by Arjun Saseendran on 05/06/26.
//

import SwiftUI

struct CircularPickerView: View {
    @EnvironmentObject var timerVM: TimerViewModel
    @StateObject private var viewModel = CircularPickerViewModel()
    private let radius: CGFloat = 150
    private let centerPoint = CGPoint(x: 150, y: 150)

    private var backCircle: some View {
        Circle()
            .stroke(.white.opacity(0.3), lineWidth: 40)
            .frame(width: radius * 2, height: radius * 2)
            .shadow(color: .white, radius: 10)
    }

    private var centerToNumberLine: some View {
        Path { path in
            path.move(to: centerPoint)
            path.addLine(to: pointForNumber(viewModel.selectedValue))
        }
        .stroke(.blue.opacity(0.5), lineWidth: 2)
    }

    private var numberCircle: some View {
        Circle()
            .fill(.blue)
            .frame(width: 40, height: 40)
            .position(pointForNumber(viewModel.selectedValue))
            .overlay {
                Text("\(viewModel.selectedValue * 5)")
                    .foregroundStyle(.primary)
                    .font(.title)
                    .frame(width: 40, height: 40)
                    .padding()
                    .background(.blue.gradient, in: Circle())
            }
    }

    private var numberForTimer: some View {
        ForEach(1...12, id: \.self) { number in
            Text("\(number * 5)")
                .font(
                    number == viewModel.selectedValue
                        ? .system(size: 16) : .system(size: 14)
                )
                .bold(number == viewModel.selectedValue)
                .foregroundStyle(
                    number == viewModel.selectedValue ? .white : .black
                )
                .position(pointForNumber(number))
        }
    }

    private var circularDragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                let selected = numberForLocation(value.location)
                viewModel.selectedValue = selected
                timerVM.time = selected * 5
                timerVM.selectedTime = selected * 5
            }
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                backCircle
                centerToNumberLine
                numberCircle
                numberForTimer
            }
            .frame(width: radius * 2, height: radius * 2)
            .gesture(circularDragGesture)
            .position(x: geo.size.width / 2, y: geo.size.height / 2)
        }
    }

    private func pointForNumber(_ number: Int) -> CGPoint {
        let angle = 2 * .pi * CGFloat(number - 3) / 12
        return CGPoint(
            x: centerPoint.x + radius * cos(angle),
            y: centerPoint.y + radius * sin(angle)
        )
    }

    private func numberForLocation(_ location: CGPoint) -> Int {
        let angle = atan2(
            location.y - centerPoint.y,
            location.x - centerPoint.x
        )
        var normalizedAngle = angle + .pi / 2
        if normalizedAngle < 0 {
            normalizedAngle += 2 * .pi
        }
        let number = Int(round((normalizedAngle / (2 * .pi)) * 12)) + 1
        return number > 12 ? 1 : number
    }
}
