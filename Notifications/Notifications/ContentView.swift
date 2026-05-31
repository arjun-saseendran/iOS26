//
//  ContentView.swift
//  Notifications
//
//  Created by Arjun Saseendran on 31/05/26.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        NavigationStack {
            VStack {
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
    @State private var additionalnfo = ""
    var body: some View {
        ZStack {
            Color.mint.opacity(0.2)
            VStack {
                Text("Recived \(counter) notifications")
                if !additionalnfo.isEmpty {
                    Text("*\(additionalnfo)*")
                }
            }

        }
        .onAppear {
            Task(priority: .background) {
                await reciveNotifications()
            }
        }

    }
    private func reciveNotifications() async {
        let center = NotificationCenter.default
        let name = Notification.Name("iOSNotifications")

        //        for await _ in center.notifications(named: name){
        //            await MainActor.run {
        //                counter += 1
        //            }
        //        }

        for await notification in center.notifications(named: name) {
            if let userInfo = notification.userInfo,
                let moreInfo = userInfo["Name"] as? String
            {
                await MainActor.run {
                    additionalnfo = moreInfo
                }
            }
            await MainActor.run {
                counter += 1
            }
        }

    }

}

struct SenderView: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2)
            Button("Send Notifications") {
                let center = NotificationCenter.default
                let name = Notification.Name("iOSNotifications")
                let additionalInfo = ["Name": "Maria"]

                //                center.post(name: name, object: nil)
                center.post(name: name, object: additionalInfo)

            }
        }
    }
}
