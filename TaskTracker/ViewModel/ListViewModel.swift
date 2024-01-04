//
//  ListViewModel.swift
//  TaskTracker
//
//  Created by Stefan Milenkovic on 4.1.24..
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newTasks = [
            TaskModel(title: "First task", isCompleted: false),
            TaskModel(title: "Second task", isCompleted: true),
            TaskModel(title: "Third task", isCompleted: false)
         ]
        tasks.append(contentsOf: newTasks)
    }
    
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func saveTask(taskTitle: String) {
        let newTask = TaskModel(title: taskTitle, isCompleted: false)
        tasks.append(newTask)
    }
    
    func updateTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index] = task.updateCompletion()
        }
    }
}
