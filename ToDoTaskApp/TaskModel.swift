//
//  TaskModel.swift
//  ToDoTaskApp
//
//  Created by Beatriz Leonel on 12/03/25.
//

import Foundation
import Observation

@Observable
class TaskModel {
    let title: String
    let date: Date
    var isDone: Bool
    
    init(title: String, date: Date, isDone: Bool) {
        self.title = title
        self.date = date
        self.isDone = isDone
    }
}
