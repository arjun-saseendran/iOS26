//
//  Move.swift
//  RockPaperScissors
//
//  Created by Arjun Saseendran on 07/06/26.
//

import SwiftUI

enum Move: String, CaseIterable {
    case rock = "🪨"
    case scissors = "✂️"
    case paper = "📄"

    func beats(_ move: Move) -> Bool {
        switch self {
        case .rock:
            return move == .scissors
        case .paper:
            return move == .rock
        case .scissors:
            return move == .paper
        }
    }

}
