//
//  Util.swift
//  vanillaClone
//
//  Created by Thanh Nguyen on 1/29/19.
//  Copyright © 2019 Dwarves Foundation. All rights reserved.
//

import AppKit
import Foundation
import ServiceManagement


class Util {
    
    static func setUpAutoStart(isAutoStart:Bool) {
        if #available(macOS 13.0, *) {
            let service = SMAppService.loginItem(identifier: Constant.launcherAppId)
            do {
                if isAutoStart {
                    try service.register()
                } else {
                    try service.unregister()
                }
            } catch {
                print("Failed to \(isAutoStart ? "register" : "unregister") login item: \(error)")
            }
        } else {
            SMLoginItemSetEnabled(Constant.launcherAppId as CFString, isAutoStart)
        }

        let isRunning = NSWorkspace.shared.runningApplications.contains { $0.bundleIdentifier == Constant.launcherAppId }

        if isRunning {
            DistributedNotificationCenter.default().post(name: Notification.Name("killLauncher"),
                                                         object: Bundle.main.bundleIdentifier!)
        }
    }
    
    static func showPrefWindow() {
        let prefWindow = PreferencesWindowController.shared.window
        prefWindow?.bringToFront()
    }
   
}
