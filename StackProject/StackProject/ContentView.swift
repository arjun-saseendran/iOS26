//
//  ContentView.swift
//  StackProject
//
//  Created by Arjun Saseendran on 25/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Mastering PDFKit")
            
                .font(.system(size: 30))
            HStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.orange)
                    .frame(width: 150, height: 150)
                    .overlay{
                        Text("SwiftUI")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                        
                    }
                RoundedRectangle(cornerRadius: 10)
                    .fill(.teal)
                    .frame(width: 150, height: 150)
                    .overlay{
                        Text("PDFKit")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
