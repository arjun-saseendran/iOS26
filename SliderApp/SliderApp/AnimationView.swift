//
//  AnimationView.swift
//  SliderApp
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct AnimationView: View {
   @State private var flag = false
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.orange.gradient)
                .frame(width: 200, height: 100)
                .overlay(
                    Text("iOS Developer")
                )
                .offset(y: flag ? 400 : 0)
//                .animation(.easeInOut(duration: 5).delay(5), value: flag)
            Spacer()
            Button("Toggle"){
//                withAnimation(.bouncy().repeatCount(3, autoreverses: true)){
                    flag.toggle()
//                }
            }
        }.animation(.spring(), value: flag)
    }
}

#Preview {
    AnimationView()
}
