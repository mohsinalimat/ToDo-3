//
//  Array.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/13/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import Foundation

extension Array {
    func random() -> Element {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
}
