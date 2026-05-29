//
//  TabViewFour.swift
//  GeometryReader
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {

    typealias Value = CGSize
    static let defaultValue: Value = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }

}

struct MeasuringSizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(

                GeometryReader{ proxy in
                    Color.clear
                        .preference( key: SizePreferenceKey.self, value: proxy.size)

                }
            )
    }
}

extension View {
    func measureSize(perform action: @escaping (CGSize) -> Void) -> some View {
       modifier(MeasuringSizeModifier())
            .onPreferenceChange(SizePreferenceKey.self, perform: action)
    }
}

struct TabViewFour: View {
    @State private var viewSize: CGSize = CGSize(width: 200, height: 50)
    @State private var lastSize: CGSize = CGSize(width: 200, height: 50)
    var body: some View {
        VStack{
//            ZStack(alignment: .bottomTrailing){
                Text("This view knows it's on size.")
                    .frame(width: viewSize.width, height: viewSize.height)
                    .background(.yellow)
                    .clipShape(.rect(cornerRadius: 10))
//                    measureSize { size in
//                        viewSize = size
//
//                    }
                    .overlay(alignment: .bottomTrailing){
                        Image(systemName: "square.resize")
                            .resizable()
                            .rotationEffect(.degrees(90))
                            .foregroundStyle(.yellow)
                            .frame(width: 20, height: 20)
                            .background(.white.gradient)
                            .offset(x:5, y: 5)
                            .gesture(DragGesture()
                                .onChanged({ gesture in
                                    let newWidth = max(100, lastSize.width + gesture.translation.width)
                                    let newHeight = max(40, lastSize.height + gesture.translation.height)
                                    viewSize = CGSize(width: newWidth, height: newHeight)

                                })
                                    .onEnded( { _ in
                                        lastSize = viewSize
                                    })
                            )

//                    }

            }

            Text("width: \(Int(viewSize.width)), height: \(Int(viewSize.height))")
        }
    }
}

#Preview {
    TabViewFour()
}
