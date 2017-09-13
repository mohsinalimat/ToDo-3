//
//  TaskInteractor.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/12/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import Foundation
import RealmSwift

class TaskInteractor: ModelInteractor {
    
    static func markTaskDone(_ task: Task, done: Bool) {
        task.isDone = done
        task.save()
    }
    
    static func deleteTask(_ task: Task) {
        let realm = try! Realm()
        try! realm.write {
        realm.delete(realm.objects(Task.self).filter("id = '\(task.id)'"))
        }
    }
}
