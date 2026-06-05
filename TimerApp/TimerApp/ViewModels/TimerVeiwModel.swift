//
//  TimerVeiwModel.swift
//  TimerApp
//
//  Created by Arjun Saseendran on 05/06/26.
//

import Combine
import SwiftUI
import UserNotifications

final class TimerViewModel: NSObject, UNUserNotificationCenterDelegate,
    ObservableObject
{
    @Published var time: Int = 0
    @Published var selectedTime: Int = 0
    @Published var buttonAnimation = false
    @Published var timerViewOffset: CGFloat = TimerViewModel.getScreenHeight()
    @Published var timerHeightChange: CGFloat = 0
    @Published var leftTime: Date!

    private static func getScreenHeight() -> CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        return windowScene?.screen.bounds.height ?? 800

    }

    func formatTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let remaingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remaingSeconds)

    }

    func resetView() {
        withAnimation {
            time = 0
            selectedTime = 0
            timerHeightChange = 0
            timerViewOffset = TimerViewModel.getScreenHeight()
            buttonAnimation = false
            leftTime = nil
        }
    }

    func performNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time's Up!"
        content.body = "Your session is over."
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: TimeInterval(time),
            repeats: false
        )

        let request = UNNotificationRequest(
            identifier: "TIMER",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request) { error in
            if let error {
                print(error.localizedDescription)
            }
        }

    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler:
            @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound])
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        resetView()
        completionHandler()

    }
}
