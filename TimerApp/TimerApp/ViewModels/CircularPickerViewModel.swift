//
//  CircularPickerViewModel.swift
//  TimerApp
//
//  Created by Arjun Saseendran on 05/06/26.
//

import SwiftUI
import Combine

final class CircularPickerViewModel: ObservableObject {
    @Published var selectedValue: Int = 5
    let totalValue: Int = 12

    func selectValue(_ value: Int) {
        selectedValue = value
    }
}
