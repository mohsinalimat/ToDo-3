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
        taskTextView.roundCorners(withRadius: 10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        guard !taskTextView.text.isEmpty else {
            self.showAlert("You can't save an empty Task!")
            return
        }
        task = Task()
        task!.text = taskTextView.text
        delegate?.didFinishEditingTask(task: task)
        dismiss(animated: true, completion: nil)
    }
}
