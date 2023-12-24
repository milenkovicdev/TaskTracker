//
//  TasksListView.swift
//  TaskTracker
//
//  Created by Stefan Milenkovic on 24.12.23..
//

import SwiftUI

struct TasksListView: View {
    
    var body: some View {
        List {
          TaskRowView(taskItem: TaskModel(title: "Test task", isCompleted: false))
        }
        .listStyle(.plain)
        .navigationTitle("Task List 🗒️")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddTaskView()
                }
            }
        }
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TasksListView()
        }
    }
}
