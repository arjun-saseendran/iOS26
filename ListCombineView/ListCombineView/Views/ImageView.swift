//
//  ImageView.swift
//  ListCombineView
//
//  Created by Arjun Saseendran on 28/05/26.
//

import SwiftUI
struct ImageView: View {
  @Binding  var place: Place

    var body: some View {
        HStack(spacing: 0){
            Image(place.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 100)
            VStack(alignment: .leading){
                Text(place.title)
                    .font(.title3)
                Text(place.description)

            }
            Spacer()

        }


    }
}

#Preview {
    ImageView(place: .constant(Place(title: "Mountain", description: "Beutiful palace for vacation", image: .mountain)))
}
