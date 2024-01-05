//
//  ListViewModel.swift
//  TaskTracker
//
//  Created by Stefan Milenkovic on 4.1.24..
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveTaskInDB()
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: Constants.UserDefaultsKeys.taskListKey),
            let decodedData = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        self.tasks = decodedData
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
    
    func saveTaskInDB() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: Constants.UserDefaultsKeys.taskListKey)
        }
    }
}
