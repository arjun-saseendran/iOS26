//
//  MessageView.swift
//  ChatBotApp
//
//  Created by Arjun Saseendran on 01/07/26.
//

import FoundationModels
import SwiftUI

struct MessageView: View {
    let segments: [Transcript.Segment]
    let isUser: Bool
    var body: some View {
        VStack {
            ForEach(segments, id: \.id) { segment in
                switch segment {
                case .text(let text):
                    if let textContent = try? AttributedString(
                        styledMarkdown: text.content
                    ) {
                        Text(textContent).padding(10)
                            .background(
                                isUser ? .blue : .black.opacity(0.2),
                                in: .rect(cornerRadius: 20)
                            )
                            .frame(
                                maxWidth: .infinity,
                                alignment: isUser ? .trailing : .leading
                            )
                    } else {
                        Text(text.content)
                            .padding(10)
                            .background(
                                isUser ? .blue : .black.opacity(0.2),
                                in: .rect(cornerRadius: 20)
                            )
                            .frame(
                                maxWidth: .infinity,
                                alignment: isUser ? .trailing : .leading
                            )
                    }

                case .structure(let structure):
                    Text(structure.description)
                @unknown default:
                    EmptyView()
                }

            }
        }
        .frame(maxWidth: .infinity)

    }
}
