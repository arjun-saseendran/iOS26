//
//  ContentView.swift
//  HakcerNewsApp
//
//  Created by Arjun Saseendran on 04/06/26.
//

import SwiftUI

struct ContentView: View {
    @State private var networkService = NetworkService()
    var body: some View {
        NavigationStack {
            List(networkService.posts) { post in
                NavigationLink {
                    DetailsView(post: post)
                } label: {
                    HStack {
                        Text(post.title)
                            .font(.headline)
                        Spacer()
                        Text(String(post.points))
                            .font(.subheadline)
                    }
                }
            }
            .task {
                await networkService.fetchPosts()
            }
            .navigationTitle("Hacker News")
        }

    }
}

#Preview {
    ContentView()
}
