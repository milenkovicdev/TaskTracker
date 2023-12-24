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
          Text("Hello")
        }
        .navigationTitle("Task List 🗒️")
    }
}

struct TasksListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TasksListView()
        }
    }
}
