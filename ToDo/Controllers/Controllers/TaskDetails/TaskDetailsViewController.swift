//
//  TaskDetailsViewController.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/13/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
