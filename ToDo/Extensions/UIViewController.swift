//
//  UIViewController.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/13/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(_ message: String, title: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}


