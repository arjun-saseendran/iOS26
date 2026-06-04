//
//  NetworkService.swift
//  HakcerNewsApp
//
//  Created by Arjun Saseendran on 04/06/26.
//

import Foundation
import Observation

@Observable
final class NetworkService {
    var posts = [Post]()

    func fetchPosts() async {
        guard
            let url = URL(
                string: "https://hn.algolia.com/api/v1/search?tags=front_page"
            )
        else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let results = try decoder.decode(Results.self, from: data)
            await MainActor.run {
                self.posts = results.hits
                print(posts)
            }
        } catch {
            print("Network/Decoding Error: \(error)")
        }
    }
}
