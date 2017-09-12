//
//  Realm.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/12/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    
    // Make an Array Copy Of objects, so if the realm data was deleted we don't get invalid data exception
    func toArray() -> [Any] {
        var array = [Any]()
        for i in 0 ..< count {
            if let result = self[i] as? BaseModel {
                array.append(result.copy())
            }
        }
        return array
    }
}
