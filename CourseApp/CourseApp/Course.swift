//
//  Course.swift
//  CourseApp
//
//  Created by Arjun Saseendran on 02/06/26.
//
import Foundation

struct Course: Identifiable {
    let id = UUID().uuidString
    var title: String
    var category: Category
    var duration: String
    var publishedDate: Date
    var desc: String
    var price: Double
}

extension Course {
    static var sampleData: [Course] {
        [
            Course(title: "SwiftUI", category: .swiftUI, duration: "1 hour", publishedDate: Date(), desc: "Master SwiftUI", price: 10.5),
            Course(title: "Swift", category: .swift, duration: "20 hour", publishedDate: Date(), desc: "Master Swift Language", price: 4.5),
            Course(title: "Machine Learning", category: .machineLearning, duration: "15 hour", publishedDate: Date(), desc: "Master Machine Learning using Swift", price: 12.0),
            Course(title: "SwiftUI", category: .swiftUI, duration: "1 hour", publishedDate: Date(), desc: "Master SwiftUI", price: 5.5),
            Course(title: "Swift", category: .swift, duration: "20 hour", publishedDate: Date(), desc: "Master Swift Language", price: 6.9),
            Course(title: "Machine Learning", category: .machineLearning, duration: "15 hour", publishedDate: Date(), desc: "Master Machine Learning using Swift", price: 9.0),
            Course(title: "SwiftUI", category: .swiftUI, duration: "1 hour", publishedDate: Date(), desc: "Master SwiftUI", price: 4.5),
            Course(title: "Swift", category: .swift, duration: "20 hour", publishedDate: Date(), desc: "Master Swift Language", price: 7.5),
            Course(title: "Machine Learning", category: .machineLearning, duration: "15 hour", publishedDate: Date(), desc: "Master Machine Learning using Swift", price: 8.9)

        ]
    }
}
