//
//  NetworkManager.swift
//  iOSNewsApp
//
//  Created by Arjun Saseendran on 31/05/26.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod = .get,
        parameters: [String: Any]? = nil,
        headers: [String: String]? = nil,
        responseType: T.Type
    ) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw NetworkError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        headers?.forEach({ key, value in
            request.setValue(value, forHTTPHeaderField: key)
        })
        if let parameters = parameters, method != .get {
            request.httpBody = try JSONSerialization.data(
                withJSONObject: parameters,
                options: []
            )
            request.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        if let httpResponse = response as? HTTPURLResponse,
           !(200 ... 299).contains(httpResponse.statusCode)
        {
            throw NetworkError.requestFailed(satusCode: httpResponse.statusCode)
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }

}

