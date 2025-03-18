//
//  ContentView.swift
//  ToDoTaskApp
//
//  Created by Beatriz Leonel on 12/03/25.
//

import SwiftUI

struct TaskView: View {
    var task: TaskModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                Text(task.date.formatted())
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                task.isDone.toggle()
            } label: {
                Label {
                    Text("checkbox")
                } icon: {
                    Image(systemName: task.isDone
                          ? "checkmark.square.fill"
                          : "square")
                }
                .labelStyle(.iconOnly)

            }

        }
        
    }
}

#Preview {
    TaskView(
        task: TaskModel(
            title: "Teste",
            date: Date(),
            isDone: false
        )
    )
}
