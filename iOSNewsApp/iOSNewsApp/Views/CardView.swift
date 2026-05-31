//
//  CardView.swift
//  iOSNewsApp
//
//  Created by Arjun Saseendran on 31/05/26.
//

import SwiftUI

struct CardView: View {
    var title: String
    var desc: String
    var author: String
    var imageUrl: String
    var body: some View {
        VStack{
            AsyncImage(url:     URL(string: imageUrl)!) { image in
                image
                    .resizable()
                    .scaledToFit()

            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            }
            .clipped()
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(author)
                    .font(.subheadline)
                Text(desc)
                    .font(.caption)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.leading)
        }
        .frame(maxWidth: .infinity)
        .clipShape(.rect(cornerRadius: 30))
        .background{
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(.white)
                .shadow(radius: 5)
            }
        .padding(10)
        }
    }

//#Preview {
//    CardView()
//}
