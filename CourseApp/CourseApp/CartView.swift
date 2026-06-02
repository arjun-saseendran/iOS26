//
//  CartView.swift
//  CourseApp
//
//  Created by Arjun Saseendran on 02/06/26.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cart: Cart
    @State private var isPresented = false
    var body: some View {
        if cart.courses.isEmpty {
            Text("Your cart is empty!")
                .foregroundStyle(.secondary)
                .navigationTitle(
                    "Cart"
                )
        } else {
            ZStack(alignment: .bottom) {
                List {
                    ForEach(cart.courses) { course in
                        Text(course.title)
                    }
                    .onDelete { idxSet in
                        cart.removeCourse(idSet: idxSet)

                    }
                }
                Button(action: {
                    isPresented.toggle()
                }) {
                    Label("Checkout", systemImage: "dollarsign.circle")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(
                            .orange,
                            in: RoundedRectangle(cornerRadius: 2)
                        )
                        .foregroundStyle(.white)
                        .contentShape(Rectangle())
                }
                .sheet(isPresented: $isPresented) {
                    cart.courses = []
                } content: {
                    CheckoutView(cart: cart)

                }
            }
            .navigationTitle("Cart")
        }
    }
}

#Preview {
    CartView(cart: Cart())
}
