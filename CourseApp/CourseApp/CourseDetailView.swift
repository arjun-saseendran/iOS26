//
//  CourseDetailView.swift
//  CourseApp
//
//  Created by Arjun Saseendran on 02/06/26.
//

import SwiftUI

struct CourseDetailView: View {
    var course: Course
    var cart: Cart
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .bottom) {
                Image(.image)
                    .resizable()
                    .scaledToFit()
                    .blur(radius: 5)
                Text(course.title)
                    .bold()
                    .font(.title)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
            }

            VStack(alignment: .leading) {
                Text(course.desc)
                listItem(item: course.duration)
                listItem(item: course.category.rawValue)
                listItem(
                    item: course.publishedDate.formatted(
                        date: .abbreviated,
                        time: .omitted
                    )
                )
                listItem(item: course.price.formatCurrency())
            }
            .padding()
            Text("Related Courses")
                .bold()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Course.sampleData) { relatedCourse in
                        Text(relatedCourse.title)
                            .frame(width: 100, height: 100)
                            .padding()
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(cornerRadius: 30)
                            )
                    }
                }
            }

            Spacer()
            Button(action: {
                cart.addCourse(course: course)
                presentationMode.wrappedValue.dismiss()

            }) {
                Label("Add to cart for \(course.price.formatCurrency())", systemImage: "cart")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.orange, in: RoundedRectangle(cornerRadius: 2))
                    .foregroundStyle(.white)
                    .contentShape(Rectangle())

            }
            .padding(.bottom)

        }
        .preferredColorScheme(.dark)
    }
    @ViewBuilder
    private func listItem(item: String) -> some View {
        HStack {
            Circle()
                .frame(width: 10, height: 10)
            Text(item)
        }
    }
}

#Preview {
    CourseDetailView(course: Course.sampleData[0], cart: Cart())
}
