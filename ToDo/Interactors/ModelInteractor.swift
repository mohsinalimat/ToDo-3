//
//  ModelInteractor.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/12/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import Foundation
import RealmSwift

protocol ModelInteractor {
    
}

extension ModelInteractor {
    
    static func offlineIndex(_ type: Object.Type, filter: String = "") -> [Any] {
        let realm = try! Realm()
        var objects = realm.objects(type)
        if !filter.isEmpty {
            objects = objects.filter(filter)
        }
        return objects.toArray()
    }
}

