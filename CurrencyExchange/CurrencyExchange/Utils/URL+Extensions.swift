//
//  URL+Extensions.swift
//  CurrencyExchange
//
//  Created by Arjun Saseendran on 03/06/26.
//

import Foundation

extension URL {
    func setQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        return components?.url
    }
}
