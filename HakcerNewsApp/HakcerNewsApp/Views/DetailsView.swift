//
//  DetailsView.swift
//  HakcerNewsApp
//
//  Created by Arjun Saseendran on 04/06/26.
//

import SwiftUI

struct DetailsView: View {
    let post: Post
    var body: some View {
        WebView(urlString: post.url)
    }
}

#Preview {
    DetailsView(post: Post(objectID: "", title: "", points: 0, url: ""))
}
