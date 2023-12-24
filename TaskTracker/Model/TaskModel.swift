//
//  TaskModel.swift
//  TaskTracker
//
//  Created by Stefan Milenkovic on 24.12.23..
//

import Foundation

struct TaskModel: Identifiable {
    let id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool
}
