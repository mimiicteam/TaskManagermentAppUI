//
//  Task.swift
//  TaskManagermentAppUI
//
//  Created by MINH DUC NGUYEN on 10/06/2022.
//

import Foundation

struct Task: Identifiable {
    var id = UUID().uuidString
    var taskTitle: String
    var taskDescription: String
    var taskDate: Date
}
