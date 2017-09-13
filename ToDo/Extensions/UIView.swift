//
//  UIView.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/13/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(withRadius cornerRadius: CGFloat,
                      borderWidth: CGFloat = 0,
                      borderColor: UIColor? = .clear) {
        layer.borderWidth   = borderWidth
        layer.borderColor   = borderColor?.cgColor
        layer.cornerRadius  = cornerRadius
        layer.masksToBounds = true
        clipsToBounds       = true
    }
}

