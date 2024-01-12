//
//  AddTaskView.swift
//  TaskTracker
//
//  Created by Stefan Milenkovic on 24.12.23..
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFiledText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type task here...", text: $textFiledText)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10.0)
                Button {
                  saveButtonTapped()
                } label: {
                    Text("Save task")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(uiColor: UIColor.systemBackground))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Add new task 🖊️")
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
    }
    
    func saveButtonTapped() {
        if textIsAppropriate() {
            listViewModel.saveTask(taskTitle: textFiledText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFiledText.count < 3 {
            alertTitle = Constants.AlertsStrings.wrongTaskLengthText
            showAlert.toggle()
            return false
        }
        return true
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaskView()
                .environmentObject(ListViewModel())
        }
    }
}
