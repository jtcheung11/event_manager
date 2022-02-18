//
//  DateHelper.swift
//  Event Manager
//
//  Created by Jonmichael Cheung on 2/17/22.
//

import Foundation


extension Date {
    func stringValue () -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from:self)
    }
}
