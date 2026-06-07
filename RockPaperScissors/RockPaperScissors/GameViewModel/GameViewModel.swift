//
//  GameViewModel.swift
//  RockPaperScissors
//
//  Created by Arjun Saseendran on 07/06/26.
//

import GameKit
import Observation
import SwiftUI

@Observable
final class GameViewModel {
    var playerMove: Move?
    var opponentMove: Move?

    var result: String = ""
    var playerScore: Int = 0
    var opponentScore: Int = 0

    private let aiOpponent = GKRandomDistribution(
        lowestValue: 0,
        highestValue: 2
    )

    func play(_ move: Move) {
        playerMove = move
        opponentMove = getAIOpponentMove()
        result = determinWinner(playerMove: move, opponentMove: opponentMove!)
        updateScore()
    }

    func getAIOpponentMove() -> Move {
        let randomIndex = aiOpponent.nextInt()
        return Move.allCases[randomIndex]
    }
    func determinWinner(playerMove: Move, opponentMove: Move) -> String {
        if playerMove == opponentMove {
            return "It's a Tie!"
        } else if playerMove.beats(opponentMove) {
            return "You Win!"
        } else {
            return "You Lose!"
        }
    }

    func updateScore() {
        if result == "You Win!" {
            playerScore += 1
        } else if result == "You Lose!" {

            opponentScore += 1

        }
    }
    func resetGame(){
        playerMove = nil
        opponentMove = nil
        result = ""
    }
}
