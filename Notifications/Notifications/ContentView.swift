//
//  ContentView.swift
//  Notifications
//
//  Created by Arjun Saseendran on 31/05/26.
//

import Foundation
import Observation
import SwiftUI

struct ContentView: View {
    @State private var systemNotification = SystemNotification()
    var body: some View {
        let layout = systemNotification.orientation == .potrait ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
        NavigationStack {
//            VStack {
//                ReciverView()
//                SenderView()
//            }
            layout {
                ReciverView()
                SenderView()
            }
            .navigationTitle("iOS Developer")
            .onChange(of: systemNotification.orientation){ oldValue, newValue
                in
                print(oldValue, "->" ,newValue)
            }
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
                //  let moreInfo = userInfo["Name"] as? String
                let moreInfo = userInfo["Name"] as? User
            {
                await MainActor.run {
                    //                    additionalnfo = moreInfo
                    additionalnfo =
                        "\(moreInfo.name) and her place is \(moreInfo.place)"
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
                // let additionalInfo = ["Name": "Maria"]
                let user = User(name: "Aswini", place: "U.K")
                let additionalInfo = ["Name": user]

                // center.post(name: name, object: nil)
                center.post(name: name, object: nil, userInfo: additionalInfo)

            }
        }
    }
}

struct User: Codable {
    var name: String
    var place: String
}

enum iOSOriantaion {
    case potrait
    case landscape
}

@Observable
final class SystemNotification {
    let center = NotificationCenter.default
    var orientation = iOSOriantaion.potrait

    init() {
        Task(priority: .background) {
            await orientationChageNotification()
        }

    }

    @MainActor
    func orientationChageNotification() async {
        let name = UIDevice.orientationDidChangeNotification
        for await notification in center.notifications(named: name) {
            if let device = notification.object as? UIDevice {
                if device.orientation.isPortrait {
                    orientation = .potrait
                } else {
                    orientation = .landscape
                }
            }
        }
    }
}

extension Notification: @unchecked Sendable {}
