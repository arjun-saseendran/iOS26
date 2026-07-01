//
//  LLMModel.swift
//  ChatBotApp
//
//  Created by Arjun Saseendran on 01/07/26.
//
import Foundation
import FoundationModels
import Observation

@Observable
final class LLMModel {
    var inputText = "Hi"
    var isThinking = false
    var isAwaitingResponse = false
    var session = LanguageModelSession(
        instructions: """
            You ara a helpful and concise assistent. Provide clear, accurate answers in a professional language. 
            """
    )

    func sendMessage() {
        Task {
            do {
                let prompt = inputText
                inputText = ""
                let stream = session.streamResponse(to: prompt)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isAwaitingResponse = false

                }
                for try await line in stream {
                    isAwaitingResponse = false
                    print(line)
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

}
