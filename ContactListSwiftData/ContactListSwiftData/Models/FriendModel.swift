//
//  FriendModel.swift
//  ContactListSwiftData
//
//  Created by Arjun Saseendran on 01/06/26.
//
import Foundation
import SwiftData

@Model
final class FriendModel {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension FriendModel {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: FriendModel.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        container.mainContext.insert(
            FriendModel(firstName: "Angel", lastName: "Maria")
        )
        container.mainContext.insert(
            FriendModel(firstName: "Aswini", lastName: "Ramachandran")
        )
        container.mainContext.insert(
            FriendModel(firstName: "Devika", lastName: "Deepa")
        )
        return container
    }

}
