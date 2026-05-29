//
//  TabView.swift
//  GeometryReader
//
//  Created by Arjun Saseendran on 29/05/26.
//

import SwiftUI

struct TabViewTwo: View {

    let tabs = ["Home", "Profile", "Cart", "Products"]
    @State private var selectedTab  = 2

    var body: some View {
        VStack{
            Spacer()
            GeometryReader { geo in
                let tabWidth = geo.size.width / CGFloat(tabs.count)
                ZStack(alignment: .leading){
                    Rectangle()
                        .fill(.white)
                        .frame(height: 80)
                        .shadow(radius: 10)

                    UnevenRoundedRectangle(bottomLeadingRadius: 10,
                    topTrailingRadius: 10)
                    .fill(.blue)
                    .frame(width: tabWidth, height: 10)

                    .offset(x: CGFloat(selectedTab) * tabWidth, y: -40)
                    .animation(.spring(), value: selectedTab)


                    UnevenRoundedRectangle(bottomLeadingRadius: 10,
                    topTrailingRadius: 10)
                    .fill(.blue)
                    .frame(width: tabWidth, height: 10)
                    .offset(x: CGFloat(selectedTab) * tabWidth, y: 40)
                    .animation(.spring(), value: selectedTab)




                    HStack(spacing: 0) {
                        ForEach(0..<tabs.count, id: \.self){ index in
                            Button(action: {
                                selectedTab = index
                            }){
                                VStack(spacing: 4){
                                    Image(systemName: tabIcon(for: index))
                                        .font(.system(size: 20))

                                    Text(tabs[index])
                                        .font(.caption)
                                }
                                .foregroundStyle(selectedTab == index ? .blue : .gray)
                                .frame(width: tabWidth, height: 80)
                            }
                        }
                    }
                }
            }
            .frame(height: 80)
        }
    }

    func tabIcon(for index: Int) -> String {
        switch index {
        case 0: return "house.fill"
        case 1: return "person.fill"
        case 2: return "cart.fill"
        case 3: return "rectangle.stack.person.crop.fill"
        default: return "circle.fill"
        }
    }
}

#Preview {
    TabViewTwo()
}
