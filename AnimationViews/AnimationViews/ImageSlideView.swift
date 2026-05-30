//
//  ImageSlideView.swift
//  AnimationViews
//
//  Created by Arjun Saseendran on 30/05/26.
//

import SwiftUI

struct ImageSlideView: View {
    let photoCollection: [ImageResource] = [
        .pic1, .pic2, .pic3, .pic4, .pic5, .pic6,
    ]
    @State private var animate = false
    var body: some View {
        NavigationStack {
            ZStack {
                PhaseAnimator(photoCollection, trigger: animate) { photoRes in
                    Image(photoRes)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                }
                animation: { _ in
                      .snappy
                }
                .onTapGesture {
                    animate.toggle()
                }
                Text("Photos")
                    .font(.largeTitle)
                    .frame(width: 300, height: 200)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(topLeadingRadius: 100, bottomTrailingRadius: 100))
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ImageSlideView()
}
