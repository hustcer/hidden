//
//  Constant.swift
//  vanillaClone
//
//  Created by Thanh Nguyen on 1/30/19.
//  Copyright © 2019 Dwarves Foundation. All rights reserved.
//

import Foundation
import AppKit

enum Constant {
    static let appName = "Hidden Bar"
    static let launcherAppId = "com.dwarvesv.LauncherApplication"

    static var isUsingLTRLanguage: Bool {
        NSApplication.shared.userInterfaceLayoutDirection == .leftToRight
    }
}
