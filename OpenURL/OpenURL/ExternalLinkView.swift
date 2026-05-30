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
            ExternalLink(url: URL(string: UIApplication.openSettingsURLString)!,label: "Settings")
            ExternalLink(url: URL(string: "mailto:arjunsaseendran@icloud.com")!, label: "Send Mail")
        }
    }
}

#Preview {
    ExternalLinkView()
}

struct ExternalLink: View {

    let url: URL
    let label: String
    @Environment(\.openURL) private var openURL
    @State private var showAlert = false

    var body: some View {
        Button(label) {
            openURL(url){ accepted in
                if !accepted {
                    showAlert = true
                }

            }
        }
        .alert("Unable to open URL", isPresented: $showAlert){
            Button("Ok", role: .cancel) {}
        } message: {
            Text("Please check the url \(url.absoluteString)")
        }
    }
}
