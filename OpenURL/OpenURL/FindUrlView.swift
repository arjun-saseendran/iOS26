//
//  FindUrlView.swift
//  OpenURL
//
//  Created by Arjun Saseendran on 30/05/26.
//

import SwiftUI

struct FindUrlView: View {
    @State private var text = ""
    @State private var detectedURL: URL? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("iOS Developer")
                .font(.largeTitle)
            TextEditor(text: $text)
                .frame(height: 150)
                .border(.gray.opacity(0.5))
                .onChange(of: text) { oldValue, newValue in
                    detectedURL = extractFirstURL(from: text)

                }
            if let detectedURL {
                Link("Open detected url: \(detectedURL.absoluteString)", destination: detectedURL)
                    .foregroundStyle(.blue)
                    .underline()
            }
            Spacer()
        }
        .padding()
    }
    func extractFirstURL(from string: String) -> URL? {
        let types: NSTextCheckingResult.CheckingType = .link
        guard let detector = try? NSDataDetector(types: types.rawValue) else {
            return nil
        }
        let matches = detector.matches(
            in: string,
            options: [],
            range: NSRange(location: 0, length: string.utf16.count)
        )
        return matches.first?.url

    }
}

#Preview {
    FindUrlView()
}
