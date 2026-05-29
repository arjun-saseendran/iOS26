//
//  ToggleMutiView.swift
//  SliderApp
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct ToggleMutiView: View {
    @State private var car = false
    @State private var bike = true
    @State private var plane = false

    var body: some View {
        VStack{
            Text("Mode of Travel")
            HStack{
                Toggle("Car", isOn: $car)
                Toggle("Bike", isOn: $bike)
                Toggle("Plane", isOn: $plane)
            }
            .toggleStyle(.button)
        }
        .padding()
    }
}

#Preview {
    ToggleMutiView()
}
