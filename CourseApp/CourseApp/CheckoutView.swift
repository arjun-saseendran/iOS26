//
//  CheckoutView.swift
//  CourseApp
//
//  Created by Arjun Saseendran on 02/06/26.
//

import SwiftUI

struct CheckoutView: View {

    @Environment(\.presentationMode) var presentationMode
    var cart: Cart
    @State private var selectedIndex = 0
    let paymentType = ["Cash", "Card", "Paypal"]
    @State private var completePayment = false

    var body: some View {
        NavigationView{
            Form{
                Section("Cart"){
                    List(cart.courses){ course in
                        HStack{
                            Text(course.title)
                            Spacer()
                            Text(course.price.formatCurrency())
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                Section("Total"){
                    HStack{
                        Text("Total amount")
                        Spacer()
                        Text(cart.courses.reduce(0,{$0 + $1.price}).formatCurrency())
                    }
                }

                Section("Payment"){
                    Picker("Payment mode", selection: $selectedIndex){
                        ForEach(paymentType.indices, id: \.self) { idx in
                            Text(paymentType[idx])
                                .tag(idx)
                        }
                    }
                }

                Section("Pay"){
                    Button(action: {
                        completePayment.toggle()
                    }){
                        Label("Pay with \(paymentType[selectedIndex])", systemImage: "dollarsign.square")
                    }
                    .alert("Thank you!", isPresented: $completePayment){
                        Button("Ok", role: .cancel){
                            presentationMode.wrappedValue.dismiss()
                        }
                    } message: {
                        Text("Your \(paymentType[selectedIndex]) payment has been received!")
                    }
                }


            }
            .navigationTitle("Checkout")
        }
    }
}

#Preview {
    CheckoutView(cart: Cart())
}
