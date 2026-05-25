//
//  ContentView.swift
//  StopWatch
//
//  Created by Arjun Saseendran on 25/05/26.
//

import SwiftUI
import Combine
import Foundation

final class StopWatchViewModel: ObservableObject {
    @Published var elapsedTime = 0
    var timer: Timer?
    func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {[weak self] _ in
            self?.elapsedTime += 1
        })
    }
}

struct ContentView: View {
    @StateObject private var vm = StopWatchViewModel()
    var body: some View {
        VStack {
            Text("Elapsed time: \(vm.elapsedTime) seconds")
            Button("Start"){
                vm.start()
            }
        }
        
    }
}
#Preview{
    ContentView()
}
