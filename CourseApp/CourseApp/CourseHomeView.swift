//
//  CourseHomeView.swift
//  CourseApp
//
//  Created by Arjun Saseendran on 02/06/26.
//

import SwiftUI

struct CourseHomeView: View {
    var courses = Course.sampleData
    var cart = Cart()
    var body: some View {
        TabView {
            NavigationView {

                List(courses) { course in

                    NavigationLink(
                        destination: CourseDetailView(
                            course: course,
                            cart: cart
                        )
                    ) {
                        CourseCardView(course: course)
                    }
                    .listRowSeparator(.hidden)
                    .navigationTitle("iOS Courses")

                }
                .listStyle(.plain)

            }
            .tabItem {
                Label("Courses", systemImage: "list.bullet.circle")
            }
            NavigationView {
                CartView(cart: cart)

            }
            .tabItem {
                Label("Cart", systemImage: "cart.circle")
            }

        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CourseHomeView()
}
