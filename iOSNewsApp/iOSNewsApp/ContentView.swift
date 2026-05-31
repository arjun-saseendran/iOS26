//
//  ContentView.swift
//  iOSNewsApp
//
//  Created by Arjun Saseendran on 31/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var news: News = .init(
        status: "",
        totalResults: 0,
        articles: []
    )
    var body: some View {
        NavigationStack {
            List(news.articles) { article in
                ZStack {
                    NavigationLink(value: article.url) {
                        EmptyView()
                    }
                    .opacity(0.0)
                    CardView(
                        title: article.title,
                        desc: article.description ?? "",
                        author: article.author ?? article.source.name,
                        imageUrl: article.urlToImage ?? ""
                    )
                }
            }
            .listStyle(.plain)
            .navigationTitle("Tech News")
            .onAppear {
                fetchNews()
            }
            .refreshable {
                fetchNews()
            }
            .navigationDestination(for: String.self) { value in
                WebView(url: URL(string: value)!)

            }
        }
    }

    func fetchNews() {
        Task {
            news =
                await News.fetchNews()
                ?? .init(status: "", totalResults: 0, articles: [])
        }
    }
}

#Preview {
    ContentView()
}
