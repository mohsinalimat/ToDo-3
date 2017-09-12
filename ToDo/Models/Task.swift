//
//  Task.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/12/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import Foundation

class Task: BaseModel {
    
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var text = ""
    @objc dynamic var dueDate = Date()
    @objc dynamic var creationDate = Date()
    @objc dynamic var isDone = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = Task()
        copy.id = id
        copy.text = text
        copy.dueDate = dueDate
        copy.creationDate = creationDate
        copy.isDone = isDone
        return copy
    }
}
