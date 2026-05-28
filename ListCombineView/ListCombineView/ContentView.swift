//
//  ContentView.swift
//  ListCombineView
//
//  Created by Arjun Saseendran on 28/05/26.
//

import SwiftUI



struct ContentView: View {
    @State var places: [Place] = [Place(title: "Mountain", description: "Beutiful palace for vacation", image: .mountain), Place(title: "Trees", description: "The lungs of the earth", image: .tree), Place(title: "Flower", description: "Beauty of love and care", image: .flower)]
    var body: some View {
        NavigationStack {
            List($places, editActions: .delete){ $place in

                ImageView(place: $place)


            }
        }
    }
}

#Preview {
    ContentView()
}
