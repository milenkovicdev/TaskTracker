//
//  TasksListView.swift
//  TaskTracker
//
//  Created by Stefan Milenkovic on 24.12.23..
//

import SwiftUI

struct TasksListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.tasks) { task in
               TaskRowView(taskItem: task)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateTask(task: task)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteTask)
            .onMove(perform: listViewModel.moveTask)
        }
        .listStyle(PlainListStyle())
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
                .environmentObject(ListViewModel())
        }
    }
}
