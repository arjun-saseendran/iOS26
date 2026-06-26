//
//  ContentView.swift
//  LiquidGlass
//
//  Created by Arjun Saseendran on 26/06/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Text("iOS Developer")
//                .font(.largeTitle)
//                .padding()
//                .glassEffect(.regular.tint(.orange.opacity(0.6)))
//            Text("iOS Developer")
//                .font(.largeTitle)
//                .padding()
//                .glassEffect(.clear.interactive())
//                .background(.orange.opacity(0.6), in: .capsule)
            List {
                VStack {
                    Text("iOS Developer")
                        .padding()
                        .glassEffect(.clear.interactive())
                }
                .listRowBackground(Color.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background{
                    Image(.bg)
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 1)
                        .ignoresSafeArea()
                }

//            }


        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background{
//            Image(.bg)
//                .resizable()
//                .scaledToFill()
//                .blur(radius: 1)
//                .ignoresSafeArea()
//        }



    }
}

#Preview {
    ContentView()
}
