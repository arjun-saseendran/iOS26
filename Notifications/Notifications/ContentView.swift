//
//  ContentView.swift
//  Notifications
//
//  Created by Arjun Saseendran on 31/05/26.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        NavigationStack{
            VStack{
                ReciverView()
                SenderView()
            }
            .navigationTitle("iOS Developer")
        }
    }
}

#Preview {
    ContentView()
}

struct ReciverView: View {
    @State private var counter = 0
    var body: some View {
        ZStack{
            Color.mint.opacity(0.2)
            Text("Recived \(counter) notifications")

        }
        .onAppear{
            Task(priority: .background){
                await reciveNotifications()
            }
        }

    }
    private func reciveNotifications() async {
        let center = NotificationCenter.default
        let name = Notification.Name("iOSNotifications")

        for await _ in center.notifications(named: name){
            await MainActor.run {
                counter += 1
            }
        }

    }

}

struct SenderView: View {
    var body: some View {
        ZStack{
            Color.blue.opacity(0.2)
            Button("Send Notifications"){
                let center = NotificationCenter.default
                let name = Notification.Name("iOSNotifications")
                center.post(name: name, object: nil)

            }
        }
    }
}
