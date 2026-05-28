//
//  ImageModel.swift
//  ListCombineView
//
//  Created by Arjun Saseendran on 28/05/26.
//

import Foundation
import SwiftUI

struct Place: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var image: ImageResource
}
