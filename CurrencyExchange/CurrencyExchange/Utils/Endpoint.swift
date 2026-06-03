//
//  Endpoint.swift
//  CurrencyExchange
//
//  Created by Arjun Saseendran on 03/06/26.
//

import Foundation

enum Endpoint {
    case `default`
    case withSymbols

    private var baseURL: URL {
        URL(string: "http://api.exchangeratesapi.io/v1/latest")!
    }

    var url: URL? {
        baseURL.setQueries(query())
    }

    func query() -> [String: String] {
        switch self {
        case .default:
            return ["access_key": "3750b2b0e766a20ad28c84dfafe73153"]
        case .withSymbols:
            return [
                "symbols": "GBP,JPY,USD,INR",
                "access_key": "3750b2b0e766a20ad28c84dfafe73153",
            ]
        }
    }
}
