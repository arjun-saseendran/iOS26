//
//  ContentView.swift
//  ListCombineView
//
//  Created by Arjun Saseendran on 28/05/26.
//

import SwiftUI

struct ContentView: View {
    @State var places: [Place] = [
        Place(
            title: "Mountain",
            description: "Beutiful palace for vacation",
            image: .mountain
        ),
        Place(
            title: "Trees",
            description: "The lungs of the earth",
            image: .tree
        ),
        Place(
            title: "Flower",
            description: "Beauty of love and care",
            image: .flower
        ),
    ]
    var body: some View {
        NavigationStack {
            List($places, editActions: .delete) { $place in

                ImageView(place: $place)
                // .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))

                // .listRowSeparator(.hidden)
//                    .listRowSeparator(.visible, edges: .top)
//                    .listRowSeparatorTint(.green)
//                    .listRowBackground(Ellipse()
//                        .background(Color.clear)
//                        .foregroundColor(.purple)
//                        .opacity(0.3))
            }
//             .listRowSpacing(20)
//            .listStyle(.plain)
            .background{
                Color.orange.opacity(0.2)
                    .ignoresSafeArea()
//                Image(.bg)
//                    .resizable()
//                    .scaledToFill()
//                    .ignoresSafeArea()
//                    .overlay{
//                        Rectangle()
//                            .fill(.blue.opacity(0.2))
//                            .ignoresSafeArea()
//                    }

            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Places")
        }
    }

}

#Preview {
    ContentView()
}
