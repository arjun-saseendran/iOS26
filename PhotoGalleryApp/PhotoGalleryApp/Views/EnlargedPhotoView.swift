//
//  EnlargedPhotoView.swift
//  PhotoGalleryApp
//
//  Created by Arjun Saseendran on 27/05/26.
//

import SwiftUI

struct EnlargedPhotoView: View {
    let imageName: String
    let onClose: () -> Void

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 20))
                    .shadow(radius: 10)

                Button(action: onClose) {
                    Text("Close")
                        .foregroundStyle(.white)
                        .padding()
                        .background(.red)
                        .clipShape(.rect(cornerRadius: 10))

                        .padding(.top, 20)
                }
            }

        }
    }

}
#Preview {
    EnlargedPhotoView(imageName: "one", onClose: <#() -> Void#>)
}
