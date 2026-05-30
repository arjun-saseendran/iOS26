//
//  DeepLink.swift
//  OpenURL
//
//  Created by Arjun Saseendran on 30/05/26.
//

import SwiftUI
import Observation

enum Route: Hashable {
    case test
    case support
    case profile
}

@Observable
final class NavigationCoordinator {
    var path = NavigationPath()

    func handleDeepLink(_ url: URL){
        guard url.scheme == "ios" else { return }
        switch url.host {
        case "test":
            path.append(Route.test)
        case "support":
            path.append(Route.support)
        case "profile":
            path.append(Route.profile)
        default:
            return
        }

    }
}

struct TestView: View {
    var body: some View {
        VStack{
            Text("🧪 Test View")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("Test Page")
    }
}

struct SupportView: View {
    var body: some View {
        VStack{
            Text("👨🏽‍💻 Support View")
                .font(.largeTitle)
                .padding()
            Spacer()
        }.navigationTitle("Support Page")
    }
}

struct ProfileView: View {
    var body: some View {
        VStack  {
            Text("🙋🏾‍♂️ Profile View")
                .font(.largeTitle)
                .padding()
            Spacer()
        }.navigationTitle("Profile Page")
    }
}


struct DeepLink: View {

    @State private var text = ""
    @State private var coordinator: NavigationCoordinator = .init()

    var body: some View {
        NavigationStack (path: $coordinator.path) {
            VStack(alignment: .leading, spacing: 16) {
                Text("ios.com")
                    .font(.largeTitle)
                TextEditor(text: $text)
                    .frame(height: 150)
                    .border(.gray.opacity(0.5))
                    .onOpenURL { url in

                        text += "\nOpenend URL: \(url)"
                        coordinator.handleDeepLink(url)
                    }

                Spacer()
            }
            .padding()
            .navigationDestination(for: Route.self){ route in
                switch route {
                case .test:
                    TestView()
                case .support:
                    SupportView()
                case .profile:
                    ProfileView()
                }
            }
        }

        }
    }



#Preview {
    DeepLink()
}
