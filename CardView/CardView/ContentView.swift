//
//  ContentView.swift
//  CardView
//
//  Created by Arjun Saseendran on 28/05/26.
//

import SwiftUI

struct ArtModel: Identifiable {
    let id = UUID()
    var image: ImageResource
    var title: String
    var description: String
    var works: String
}

extension ArtModel {
    static var sample: [ArtModel] {
        [
            self.init(
                image: .one,
                title: "Model Girl",
                description: "A model from girl from China",
                works: "Apple, Nike, Adidas"
            ),
            self.init(
                image: .two,
                title: "Model Couple",
                description: "A model couple from girl from Khana",
                works: "Samsung, Apple, Nike"
            ),
            self.init(
                image: .three,
                title: "Model Group",
                description: "A model group from Zambia ",
                works: "LG, Apple, Nike"

            ),

        ]
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            Text("Models")
                .font(.title)
            ForEach(ArtModel.sample) { model in
                CardView(artModel: model)
            }
        }
    }
}

struct CardView: View {
    var artModel: ArtModel
    var body: some View {
        VStack {
            Image(artModel.image)
                .resizable()
                .scaledToFit()

            HStack {
                VStack(alignment: .leading) {
                    Text(artModel.description)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Text(artModel.title)
                        .font(.title3.bold())
                    HStack {
                        Spacer()
                        Text(artModel.works)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding()
            }

        }
        .clipShape(.rect(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray.opacity(0.4), lineWidth: 2)
                .shadow(radius: 4)
        }

        .padding()

    }
}

#Preview {
    ContentView()
}
