//
//  ExchangeRate.swift
//  CurrencyExchange
//
//  Created by Arjun Saseendran on 03/06/26.
//
import Foundation

struct ExchangeRate: Codable, Identifiable, Equatable {
    let id = UUID()
    let date: String?
    let rates: [String:Double]?

    private enum CodingKeys: CodingKey{
        case date, rates
    }
}

extension ExchangeRate {
    static var placeholder: ExchangeRate { Self(date: nil, rates: nil)}
}
