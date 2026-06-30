import Observation
//
//  DisableView.swift
//  StartRatingsApp
//
//  Created by Arjun Saseendran on 30/06/26.
//
import SwiftUI

struct SelectionDisableView: View {
    @State private var model = CourseStore()
    @State private var selectedCourses: Set<String> = []
    var body: some View {
        NavigationStack {
            List(selection: $selectedCourses) {

                ForEach(model.data) { course in

                    HStack {
                        Text(course.emoji)
                        Text(course.name)
                    }
                    .selectionDisabled(!course.published)
                }

            }
            .navigationTitle(Text("iOS Developer"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }

}

#Preview {
    SelectionDisableView()
}

struct CourseModel: Identifiable, Hashable {

    var name: String
    var published: Bool
    var emoji: String
    var id: String { name }
}

@Observable
class CourseStore {
    var data: [CourseModel] = [
        CourseModel(name: "Swift UI", published: true, emoji: "🍎"),
        CourseModel(name: "Swift Data", published: true, emoji: "💿"),
        CourseModel(name: "ML", published: true, emoji: "🧠"),
        CourseModel(name: "Mac App", published: false, emoji: "🖥️"),
    ]
}
