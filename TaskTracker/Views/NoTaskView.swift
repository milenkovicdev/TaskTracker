//
//  NoTaskView.swift
//  TaskTracker
//
//  Created by Stefan Milenkovic on 6.1.24..
//

import SwiftUI

struct NoTaskView: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no tasks!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you productive person? I think you should click the add button and add a bunck of tasks in yoru tasks list.")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddTaskView()) {
                    Text("Add some task 🤔")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Constants.TTColors.secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(
                    color: animate ? Constants.TTColors.secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30 : 10, x: 0, y: animate ? 50 : 30
                )
                    
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
       
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoTaskView()
                .navigationTitle("Sample title")
        }
        
    }
}
