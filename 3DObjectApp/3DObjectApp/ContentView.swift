//
//  ContentView.swift
//  3DObjectApp
//
//  Created by Arjun Saseendran on 18/06/26.
//

import ARKit
import QuickLook
import SwiftUI

enum Item: String, Identifiable, CaseIterable {
    case chair = "chair"
    case gramophone = "gramophone"
    case guitar = "guitart"
    case tv = "tv"

    var id: String { self.rawValue }

    var icon: String {
        switch self {
        case .chair: return "🪑"
        case .gramophone: return "📻"
        case .guitar: return "🎸"
        case .tv: return "📺"
        }
    }

    var name: String {
        switch self {
        case .chair: return "Chair"
        case .gramophone: return "Gramophone"
        case .guitar: return "Guitar"
        case .tv: return "TV"
        }
    }
}

struct ContentView: View {
    @State private var selectedItem: Item?
    @State private var showItem = false

    var body: some View {
        NavigationStack {
            List(Item.allCases) {
                item in
                HStack {
                    Text(item.icon)
                    Text(item.name)
                    Spacer()
                }
                .font(.title2)
                .padding()
                .contentShape(.rect)
                .onTapGesture {
                    selectedItem = item
                }

            }
            .navigationTitle("3D Item Explorer")
            .onChange(of: selectedItem) { _, _ in
                showItem.toggle()

            }
            .sheet(isPresented: $showItem) {
                if let selectedItem {
                    NavigationStack {
                        ARQuicklookView(name: selectedItem.rawValue)
                            .toolbar {
                                ToolbarItem(placement: .topBarTrailing) {
                                    Button {
                                        showItem.toggle()

                                    } label: {
                                        Image(systemName: "xmark.circle")
                                            .font(.title3)
                                            .foregroundStyle(.primary)

                                    }
                                    .buttonStyle(.plain)

                                }

                            }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ARQuicklookView: UIViewControllerRepresentable {
    var name: String
    func makeCoordinator() -> ARQuicklookView.Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> QLPreviewController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        return controller
    }

    func updateUIViewController(
        _ uiViewController: QLPreviewController,
        context: Context
    ) {

    }

    class Coordinator: NSObject, QLPreviewControllerDataSource {
        var parent: ARQuicklookView
        private lazy var fileURL: URL = Bundle.main.url(
            forResource: parent.name,
            withExtension: "usdz"
        )!
        init(_ parent: ARQuicklookView) {
            self.parent = parent
            super.init()
        }

        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }
        func previewController(
            _ controller: QLPreviewController,
            previewItemAt index: Int
        ) -> QLPreviewItem {
            guard
                let fileURL = Bundle.main.url(
                    forResource: parent.name,
                    withExtension: "usdz"
                )
            else {
                fatalError("Unable to find \(parent.name).usdz")
            }
            let item = ARQuickLookPreviewItem(fileAt: fileURL)
            return item
        }

    }
}
