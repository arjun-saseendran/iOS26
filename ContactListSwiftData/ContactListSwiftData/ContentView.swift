//
//  ContentView.swift
//  ContactListSwiftData
//
//  Created by Arjun Saseendran on 01/06/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var friends: [FriendModel]
    var body: some View {
        NavigationStack{
            List(friends){ friend in
                HStack(spacing: 5){
                    Text(friend.firstName)
                    Text(friend.lastName)
                }
            }
            .navigationTitle("Contact List")
        }
    }
}

#Preview (traits: .modifier(FriendModelPreviewModifier())){
    ContentView()
}
