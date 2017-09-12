//
//  TaskInteractor.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/12/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import Foundation

class TaskInteractor: ModelInteractor {
    static func markTaskDone(_ task: Task) {
        task.isDone = true
        task.save()
    }
}
