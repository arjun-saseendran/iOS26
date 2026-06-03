//
//  ExchageRateService.swift
//  CurrencyExchange
//
//  Created by Arjun Saseendran on 03/06/26.
//

import Combine
import Foundation

final class ExchangeRateService {
    static let shared = ExchangeRateService()

    func getExchangeRate() -> AnyPublisher<ExchangeRate, Error> {
        return urlSession(ExchangeRate.self, with: Endpoint.default.url!)
    }

    func urlSession<T: Codable>(_ type: T.Type, with url: URL) -> AnyPublisher<
        T, Error
    > {
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: type.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .print()
            .eraseToAnyPublisher()
    }
}
