//
//  ContentView.swift
//  StartRatingsApp
//
//  Created by Arjun Saseendran on 27/06/26.
//

import SwiftUI

struct ContentView: View {
    let ratings: Double
    @State private var animateRating: Double = 0.0
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<5){ index in
                starView(for: index)

            }
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 0.6)){
                animateRating = ratings
            }
        }
        .onChange(of: ratings){ _, newRating in
            withAnimation(.easeInOut(duration: 0.6)){
                animateRating = ratings
            }

        }
    }

    @ViewBuilder
    private func starView(for index: Int) -> some View {
    let fillAmount = min(max(animateRating - Double(index), 0), 1)
        ZStack {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.gray.gradient.opacity(0.3))
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(
                    LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing)
                )
                .mask {
                    GeometryReader{ geometry in

                        Rectangle()
                            .frame(width: geometry.size.width * fillAmount)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
        }
        .frame(width: 30, height: 30)
    }

}


#Preview {
    VStack(spacing: 20) {
        ContentView(ratings: 4.5)
        ContentView(ratings: 2.5)
        ContentView(ratings: 4.1)
        ContentView(ratings: 4.0)
        ContentView(ratings: 3.7)
    }
    .padding()

}
