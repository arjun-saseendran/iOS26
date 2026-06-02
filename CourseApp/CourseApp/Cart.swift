//
//  Cart.swift
//  CourseApp
//
//  Created by Arjun Saseendran on 02/06/26.
//

import Foundation
import Combine
import SwiftUI

class Cart: ObservableObject {
    @Published var courses: [Course] = []

    func addCourse(course: Course) {
        courses.append(course)
    }

    func removeCourse(idSet: IndexSet){
        courses.remove(atOffsets: idSet)
    }
}
