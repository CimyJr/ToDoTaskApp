//
//  ListTaskView.swift
//  ToDoTaskApp
//
//  Created by user on 13/03/25.
//

import SwiftUI

struct ListTaskView: View {
    @State var tasks: [TaskModel] = [
        TaskModel(title: "Task 1", date: Date()),
        TaskModel(title: "Task 2", date: Date()),
        TaskModel(title: "Task 3", date: Date()),
        TaskModel(title: "Task 4", date: Date()),
        TaskModel(title: "Task 5", date: Date()),
    ]

    @State var addTask: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(tasks) { task in
                        TaskView(task: task)
                            .swipeActions(allowsFullSwipe: false) {
                                deleteTask(task)
                                viewTask(task)
                            }

                    }

                } header: {
                    Text("Tasks")
                } footer: {
                    Text("Total:  \(tasks.count)")
                }
            }
            .listStyle(.insetGrouped)
            .sheet(isPresented: $addTask) {
                AddTaskView(tasks: $tasks)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        addTask.toggle()

                    } label: {
                        Label {
                            Text("Add Task")
                        } icon: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .navigationTitle("Tasks List")
        }

    }
    
    func deleteTask(_ task: TaskModel) -> some View {
        Button(role: .destructive) {
            tasks.removeAll { currentTask in
                currentTask.id == task.id
            }
        } label: {
            Label {
                Text("Delete")
            } icon: {
                Image(systemName: "trash")
            }
        }
    }
    func viewTask(_ task: TaskModel) -> some View {
        NavigationLink{
            DetailsTaskView(task: task)
        }label: {
            Image(SystemIma)
        }
    }
}

#Preview {
    ListTaskView()
}
