//
//  BaseModel.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/12/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import Foundation
import RealmSwift

class BaseModel: Object, NSCopying {
    
    func save() {
        let realm = try! Realm()
        try! realm.write {
            realm.add(self, update: true)
        }
    }
    
    // MAKR: NSCopying
    public func copy(with zone: NSZone? = nil) -> Any {return (Any).self}
}
