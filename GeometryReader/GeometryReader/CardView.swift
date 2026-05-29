//
//  CardView.swift
//  GeometryReader
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Image(.home)
                    .resizable()
                    .scaledToFill()
                    .frame(height: geo.size.height * 0.6)
                    .clipped()
                VStack(alignment: .leading) {
                    Text("Sweet Home")
                        .font(.headline)
                    Text(
                        "This image takes 60% of the height and the conetent takes the remaining space is 40%"
                    )
                    .font(.subheadline)
                    .foregroundStyle(.orange.shadow(.drop(radius: 2)))
                    Spacer()

                    HStack {
                        Spacer()
                        Text("View More")
                            .font(.caption)
                            .foregroundStyle(.blue.gradient)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(.blue.opacity(0.2))
                            .clipShape(.rect(cornerRadius: 4))

                    }

                }
                .padding()
                .frame(height: geo.size.height * 0.4)
            }
            .background(.white)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(radius: 5)

        }
        .frame(height: 500)
        .padding()
    }
}

#Preview {
    CardView()
}
