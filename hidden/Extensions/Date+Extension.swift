//
//  Date+Extension.swift
//  Hidden Bar
//
//  Created by Trung Phan on 22/03/2021.
//  Copyright © 2021 Dwarves Foundation. All rights reserved.
//

import Foundation

extension Date {
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE dd MMM"
        return formatter
    }()

    private static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()

    static func dateString() -> String {
        dateFormatter.string(from: Date())
    }
    static func timeString() -> String {
        timeFormatter.string(from: Date())
    }
}
