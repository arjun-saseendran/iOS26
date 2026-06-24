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
            return .purple
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
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
