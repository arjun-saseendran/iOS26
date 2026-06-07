//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Arjun Saseendran on 07/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = GameViewModel()
    @State private var isAnimating = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Rock Scissors Paper")
                .font(.title)
                .padding()


            HStack {
                Text("Player: \(viewModel.playerScore)")
                Spacer()
                Text("AI: \(viewModel.opponentScore)")

            }
            .padding()
            Spacer()
            if let playerMove = viewModel.playerMove,
               let opponentMove =
                viewModel.opponentMove
            {
                VStack {
                    Text("You chose: \(playerMove.rawValue)")
                        .font(.title)
                        .transition(.scale.combined(with: .opacity))
                    Text("Opponent chose: \(opponentMove.rawValue)")
                        .font(.title)
                        .transition(.scale.combined(with: .opacity))
                    Text(viewModel.result)
                        .font(.title)
                        .padding()
                        .transition(.scale.combined(with: .opacity))
                    Button("Play Again") {
                        withAnimation(
                            .spring(
                                response: 0.6,
                                dampingFraction: 0.8,
                                blendDuration: 0
                            )
                        ) {
                            viewModel.resetGame()
                        }

                    }
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .shadow(radius: 10)
                .transition(.move(edge: .bottom).combined(with: .opacity))

            } else {
                ForEach(Move.allCases, id: \.self) { move in
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            viewModel.play(move)
                        }
                    }) {
                        Text(move.rawValue)
                            .font(.system(size: 50))
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 10))
                            .scaleEffect(isAnimating ? 1.2 : 1.0)
                            .animation(
                                .easeIn(duration: 0.5).repeatCount(
                                    3,
                                    autoreverses: true
                                ),
                                value: isAnimating
                            )
                    }
                    .onAppear {
                        isAnimating = true
                    }
                }

            }
            Spacer()
        }

    }
}

#Preview {
    ContentView()
}
