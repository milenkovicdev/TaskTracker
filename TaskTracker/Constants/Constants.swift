//
//  Constants.swift
//  TaskTracker
//
//  Created by Stefan Milenkovic on 4.1.24..
//

import Foundation
import SwiftUI

struct Constants {
    struct AlertsStrings {
        static let wrongTaskLengthText = "Your new task must be at least 3 characters long!"
    }
    
    struct SystemImageNames {
        static let square = "square"
        static let checkmarkSquare = "checkmark.square"
    }
    
    struct UserDefaultsKeys {
        static let taskListKey = "task_list"
    }
    
    struct TTColors {
        static let secondaryAccentColor = Color("SecondaryAccentColor")
    }
}
