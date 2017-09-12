//
//  TaskDetailsViewController.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/13/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

protocol TaskDetailsDelegate {
    func didFinishEditingTask(task: Task?)
}

class TaskDetailsViewController: UIViewController {
    var task: Task?
    var delegate: TaskDetailsDelegate?
    
    @IBOutlet weak var taskTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        task = Task()
        task!.text = taskTextView.text
        delegate?.didFinishEditingTask(task: task)
        dismiss(animated: true, completion: nil)
    }
}
