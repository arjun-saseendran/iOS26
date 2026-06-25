//
//  ContentView.swift
//  SegmentedControllApp
//
//  Created by Arjun Saseendran on 24/06/26.
//

import SwiftUI

enum AppTab: String, CaseIterable {
    case swiftUI = "SwiftUI"
    case iOS = "iOS"
    case UIKit = "UIKit"

    var color: Color {
        switch self {
        case .swiftUI:
            return .orange
        case .iOS:
            return .blue
        case .UIKit:
            return .green
        }
    }

    var icon: String {
        switch self {
        case .swiftUI:
            return "swift"
        case .iOS:
            return "apple.logo"
        case .UIKit:
            return "macwindow"
        }
    }

}

struct ContentView: View {
    @State private var selectedTab: AppTab = .UIKit
    @Namespace private var animation
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Image(systemName: selectedTab.icon)
                        .font(.system(size: 80))
                        .foregroundStyle(selectedTab.color)
                    Text(selectedTab.rawValue)
                        .font(.largeTitle.bold())

                }
                .padding(60)
                .frame(width: 300, height: 200)
                .background(
                    selectedTab.color.opacity(0.15).gradient,
                    in: .rect(cornerRadius: 20)
                )
                Spacer()
                customSegmentedControl
                Spacer()

            }

            .navigationTitle("iOS Developer")
        }
    }
    @ViewBuilder
    var customSegmentedControl: some View {
        HStack(spacing: 0) {
            ForEach(AppTab.allCases, id: \.rawValue) { tab in
                Text(tab.rawValue)
                    .font(.headline)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(
                        selectedTab == tab ? .white : .primary.opacity(0.7)
                    )
                    .background {
                        if selectedTab == tab {
                            Capsule()
                                .foregroundStyle(selectedTab.color.gradient)
                                .matchedGeometryEffect(
                                    id: "selected_tab",
                                    in: animation
                                )
                        }
                    }
                    .contentShape(.rect)
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            self.selectedTab = tab
                        }

                    }

            }
        }
        .padding(6)
        .background(.primary.opacity(0.08), in: .capsule)
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
