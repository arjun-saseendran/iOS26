//
//  ContentView.swift
//  StoreKit
//
//  Created by Arjun Saseendran on 30/06/26.
//

import SwiftUI
import WebKit
import StoreKit


struct ContentView: View {
    var body: some View {
       StoreKitReviewExample()
    }
}

#Preview {
    ContentView()
}

struct CardItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

struct CardView: View {
    let title: String
    let systemImageName: String
    var body: some View {
        HStack {
            Image(systemName: systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundStyle(.blue.gradient)
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            Spacer()

        }
        .padding()
        .background(Color.primary.colorInvert())
        .clipShape(.rect(cornerRadius: 20))
        .shadow(color: .primary.opacity(0.5), radius: 5, x: 0, y: 0)
        .padding(.horizontal)
    }
}

struct StoreKitReviewExample: View {
    @Environment(\.requestReview) var requestReview
    let cardData: [CardItem] = [
        CardItem(title: "Settings", imageName: "gear"),
        CardItem(title: "Profile", imageName: "person.circle"),
        CardItem(title: "Fovorites", imageName: "heart.fill"),
        CardItem(title: "Messages", imageName: "envelope.fill"),
    ]
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.pink.opacity(0.3), .blue.opacity(0.3)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                List {
                    ForEach(cardData) { data in
                        CardView(
                            title: data.title,
                            systemImageName: data.imageName
                        )
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)

                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .navigationTitle("iOS Developer App Review")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Rate US") {
                            requestReview()
                        }
                    }
                }
            }

        }
    }

}

