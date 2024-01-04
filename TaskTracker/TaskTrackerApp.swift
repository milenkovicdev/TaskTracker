//
//  TaskTrackerApp.swift
//  TaskTracker
//
//  Created by Stefan Milenkovic on 15.12.23..
//

import SwiftUI

@main
struct TaskTrackerApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TasksListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
