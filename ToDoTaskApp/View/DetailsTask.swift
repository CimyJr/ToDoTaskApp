//
//  DetailsTask.swift
//  ToDoTaskApp
//
//  Created by user on 18/03/25.
//

import SwiftUI

struct DetailsTask: View {
    var item: TaskModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Título:")
                    .fontWeight(.bold)
                Text(item.title)

            }
            
            HStack{
                Image(systemName: "calendar")
                Text("Data")
                Text(item.date.formatted(.dateTime.day(.twoDigits).month(.twoDigits)))
            }
            HStack{
                Image(systemName: "clock")
                Text("Hora")
                Text(item.date.formatted(.dateTime.hour(.twoDigits(amPM: .omitted)).minute(.twoDigits)))
            }
            
            HStack{
                Image(systemName: item.isDone ? "checkmark.square" : "square")
                Text(item.isDone ? "Concluído" : "Pendente")
                
            }
        }
        .navigationTitle(item.title)
    }
}

#Preview {
    DetailsTask(item: .init(title: "Teste", date: Date(), isDone: false))
}
