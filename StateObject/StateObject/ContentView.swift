//
//  ContentView.swift
//  StateObject
//
//  Created by Arjun Saseendran on 25/05/26.
//

import SwiftUI
import Combine


final class CartViewModel: ObservableObject {
    @Published var products = ["iPhone", "Macbook", "iPad", "AirPods", "Apple Watch"]
}

struct CartView: View {
    @ObservedObject var cart: CartViewModel
    var body: some View{
        List(cart.products, id: \.self){ product in
            Text(product)
        }
    }
}

struct ContentView: View {
    @StateObject var cart = CartViewModel()
    var body: some View {
        VStack {
            
            CartView(cart: cart)
        }
        
    }
}

#Preview {
    ContentView()
}
