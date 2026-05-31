//
//  CustomErrors.swift
//  iOSNewsApp
//
//  Created by Arjun Saseendran on 31/05/26.
//

enum NetworkError: Error {
    case invalidURL
    case requestFailed(satusCode: Int)
    case decodingError
    case unknownError
}
