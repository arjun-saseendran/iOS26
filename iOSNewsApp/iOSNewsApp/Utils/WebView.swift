//
//  WebView.swift
//  iOSNewsApp
//
//  Created by Arjun Saseendran on 31/05/26.
//

import WebKit
import Foundation
import SwiftUI

struct WebView: UIViewRepresentable{
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
        .init()
    }

    func updateUIView(_ webview: WKWebView, context: Context){
        webview.load(URLRequest(url: url))
    }

}
