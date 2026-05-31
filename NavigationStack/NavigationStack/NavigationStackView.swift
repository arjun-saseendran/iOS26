//
//  NavigationStackView.swift
//  NavigationStack
//
//  Created by Arjun Saseendran on 31/05/26.
//

import SwiftUI

struct NavigationDestination: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("iOS Developer")
                    .font(.largeTitle)
                NavigationLink(value:"Page 1"){
                    Text("Hello iOS Developer")
                }
            }
            .navigationDestination(for: String.self){ value in
                ProfileView(title: value)
            }
        }
    }
}

struct ProfileView: View {
    var title: String
    var body: some View {
    Text("Profile: \(title)")
    }
}

#Preview {
    NavigationDestination()
}
