//
//  TaskRowView.swift
//  TaskTracker
//
//  Created by Stefan Milenkovic on 24.12.23..
//

import SwiftUI

struct TaskRowView: View {
    
    let taskItem: TaskModel
    
    var body: some View {
        HStack {
            Image(systemName: taskItem.isCompleted ? Constants.SystemImageNames.checkmarkSquare : Constants.SystemImageNames.square)
                .foregroundColor(taskItem.isCompleted ? Color.green : Color.red)
            Text(taskItem.title)
            Spacer()
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var item = TaskModel(title: "Some test task ", isCompleted: false)
    static var previews: some View {
        TaskRowView(taskItem: item)
    }
}
