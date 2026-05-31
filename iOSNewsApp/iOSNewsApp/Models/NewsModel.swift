//
//  NewsModel.swift
//  iOSNewsApp
//
//  Created by Arjun Saseendran on 31/05/26.
//

import Foundation

struct News: Codable, Identifiable {
    let id = UUID()
    let status: String
    let totalResults: Int
    let articles: [Article]

    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }

}

struct Article: Codable, Identifiable {
    let id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String?

    enum CodingKeys: CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }
}

struct Source: Codable {
    let id: String?
    let name: String
}

extension News {
    static func fetchNews() async -> News? {
        do {
            let news = try await NetworkManager.shared.request(
                endpoint:
                    "https://newsapi.org/v2/top-headlines?category=technology&country=us&apiKey=bde383f0cfb845c6b66a27a2a80268fe",
                responseType: News.self
            )
            return news
        } catch {

        }
        return nil
    }
}
