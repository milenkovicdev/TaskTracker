//
//  AddTaskView.swift
//  TaskTracker
//
//  Created by Stefan Milenkovic on 24.12.23..
//

import SwiftUI

struct AddTaskView: View {
    @State var textFiledText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type task here...", text: $textFiledText)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10.0)
                Button {
                    // logic here
                } label: {
                    Text("Save task")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Add new task 🖊️")
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaskView()
        }
    }
}
