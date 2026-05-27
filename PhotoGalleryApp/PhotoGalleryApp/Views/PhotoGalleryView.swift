//
//  PhotoGalleryView.swift
//  PhotoGalleryApp
//
//  Created by Arjun Saseendran on 26/05/26.
//

import SwiftUI

struct PhotoGalleryView: View {
    @State private var selectedImage: String? = nil
    let images = ["one", "two", "three"]
    var body: some View {
        NavigationStack {
            VStack {
                if let selectedImage {
                    EnlargedPhotoView(imageName: selectedImage) {
                        self.selectedImage = nil
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 20) {

                            ForEach(images, id: \.self) { image in
                                Image(image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                                    .clipShape(.rect(cornerRadius: 10))
                                    .shadow(radius: 5)
                                    .onTapGesture {
                                        self.selectedImage = image
                                    }

                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }

            }.navigationTitle("Photo Gallery")
        }
    }
}

#Preview {
    PhotoGalleryView()
}
