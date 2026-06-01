//
//  FriendModelPreviewModifier.swift
//  ContactListSwiftData
//
//  Created by Arjun Saseendran on 01/06/26.
//

import Foundation
import SwiftUI
import SwiftData

struct FriendModelPreviewModifier: PreviewModifier {
    typealias Context = ModelContainer

    static func makeSharedContext() async throws -> ModelContainer {
        FriendModel.preview
    }

    func body(content: Content, context: ModelContainer) -> some View {
        content
            .modelContainer(context)
    }

}
