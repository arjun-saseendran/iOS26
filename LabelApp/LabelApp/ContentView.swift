//
//  ContentView.swift
//  LabelApp
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Label{
//            Text("Indoor")
//                .font(.title)
//        } icon: {
//            Image(.image)
//                .resizable()
//                .frame(width: 30, height: 30)
//                .clipShape(.circle)
//        }
//        .labelStyle(CustomLabelStyle(iconColor: .mint, titleColor: .orange, backgroundColor: .mint))
//        .labelStyle(.iconOnly)

        List {
            Text("New Courses")
                .font(.largeTitle)
            Label {
                Text("SwiftUI")
            } icon: {
                Image(systemName: "person.circle")
            }
            Label{
                Text("SwiftUI Deep Dive")
            } icon: {
                Image(systemName: "envelope")
            }
            Label {
                Text("Swift Master Calss")

            } icon :{
                Image(systemName: "calendar.day.timeline.right")
            }


        }

//        List {
//            Text("New Courses")
//                .font(.largeTitle)
//            HStack{
//                Image(systemName: "person.circle")
//                Text("Master SwiftUI")
//            }
//            HStack{
//                Image(systemName: "envelope")
//                Text("Master Swift Language")
//            }
//            HStack {
//                Image(systemName: "calendar.day.timeline.right")
//                Text("Master iOS App Development")
//            }
//        }

    }
}

#Preview {
    ContentView()
}

struct CustomLabelStyle: LabelStyle {
    let iconColor: Color
    let titleColor: Color
    let backgroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center){
            configuration.icon
                .foregroundStyle(iconColor.gradient)
            configuration.title
                .foregroundStyle(titleColor.gradient)
                .font(.title2)
            configuration.icon
                .foregroundStyle(iconColor.gradient)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).fill(backgroundColor.gradient.opacity(0.2)))
    }
}
