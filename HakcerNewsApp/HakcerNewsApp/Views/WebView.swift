//
//  WebView.swift
//  HakcerNewsApp
//
//  Created by Arjun Saseendran on 04/06/26.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let urlString, let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }

}
