//
//  GeometryThree.swift
//  GeometryReader
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct GeometryThree: View {
    let items = Array(1...20).map { "Item \($0)" }
    let columns = 3
    let spacing: CGFloat = 10

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                let itemWidth =
                    (geo.size.width - (spacing * CGFloat(columns - 1)))
                    / CGFloat(columns)

                LazyVGrid(
                    columns: gridItems(width: itemWidth),
                    spacing: spacing
                ) {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .frame(height: 100)
                            .frame(maxWidth: .infinity)
                            .background(.blue.opacity(0.2))
                            .clipShape(.rect(cornerRadius: 10))

                    }
                }
            }
        }
        .padding()
    }

    func gridItems(width: CGFloat) -> [GridItem] {
        Array(
            repeating: GridItem(.fixed(width), spacing: spacing),
            count: columns
        )
    }
}

#Preview {
    GeometryThree()
}
