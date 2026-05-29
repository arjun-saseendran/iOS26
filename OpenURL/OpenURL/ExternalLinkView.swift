//
//  ExternalLinkView.swift
//  OpenURL
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct ExternalLinkView: View {
    var body: some View {
        List {
            ExternalLink(url: URL(string: "https://www.google.com")!, label: "Google")
            ExternalLink(url: URL(string: "https://www.yahoo.com")!, label: "Yahoo")
        }
    }
}

#Preview {
    ExternalLinkView()
}
