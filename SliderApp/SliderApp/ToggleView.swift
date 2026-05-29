//
//  ToggleView.swift
//  SliderApp
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct ToggleView: View {
    @State private var agreePrivacy = false
    var body: some View {
        VStack{
            Text("Please accepts our terms and conditions")
                .font(.largeTitle)
            Toggle(isOn: $agreePrivacy){
                Text("Terms of use and privacy")
            }
            Button("Submit"){

            }
            .disabled(!agreePrivacy)
        }
        .padding()
    }
}

#Preview {
    ToggleView()
}
