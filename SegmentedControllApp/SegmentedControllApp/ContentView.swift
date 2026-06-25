//
//  ContentView.swift
//  SegmentedControllApp
//
//  Created by Arjun Saseendran on 24/06/26.
//

import SwiftUI

protocol SegmentItem: Hashable & CaseIterable & RawRepresentable where
RawValue == String {
    var icon: String { get }
    var color: Color { get }
}

enum AppTab: String, SegmentItem {
    case swiftUI = "SwiftUI"
    case iOS = "iOS"
    case UIKit = "UIKit"
//    case ML = "ML"

    var color: Color {
        switch self {
        case .swiftUI:
            return .orange
        case .iOS:
            return .blue
        case .UIKit:
            return .green
//        case .ML:
//            return .purple
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
//        case .ML:
//            return "brain"
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
//                customSegmentedControl
                ReusableSegmentedControl(selection: $selectedTab)
                Spacer()

            }

            .navigationTitle("iOS Developer")
        }
    }
    @ViewBuilder
    var customSegmentedControl: some View {
        HStack(spacing: 0) {
            ForEach(AppTab.allCases, id: \.rawValue) { tab in
                HStack(spacing: 8){
                    Image(systemName: tab.icon)
                    Text(tab.rawValue)
                }

                    .font(.headline)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(
                        selectedTab == tab ? .white : .primary.opacity(0.7)
                    )
                    .background {
                        if selectedTab == tab {
//                            Capsule()
                            RoundedRectangle(cornerRadius: 5, style: .circular)
                                .frame(height: 3)
                                .offset(y: 15)
                                .foregroundStyle(selectedTab.color.gradient)
                                .matchedGeometryEffect(
                                    id: "selected_tab",
                                    in: animation
                                )
                        }
                    }
                    .contentShape(.rect)
                    .onTapGesture {
                        withAnimation(.interactiveSpring) {
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

struct ReusableSegmentedControl<T: SegmentItem>: View{
    @Binding var selection: T
    private let items: [T] = T.allCases as! [T]
    @Namespace private var animation



    var body: some View {
        HStack(spacing: 0){
            ForEach(items, id: \.self){ item in
                HStack(spacing: 8){
                    Image(systemName: item.icon)
                    Text(item.rawValue)
                }

                    .font(.headline)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(selection == item ? .white : .primary.opacity(0.7))
                    .background {
                        if selection == item {
                            Capsule()
                                .foregroundStyle(item.color.gradient)
                                .matchedGeometryEffect(id: "reusable_segmentId", in: animation)
                        }
                    }
                    .contentShape(.rect)
                    .onTapGesture{
                        withAnimation(.bouncy){
                            selection = item
                        }
                    }

            }
        }
        .padding(6)
        .background(.primary.opacity(0.08), in: .capsule)
        .padding(.horizontal)

    }
}
