//
//  ToDoViewController.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/12/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks = [Task]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ToDo"
        tasks  = TaskInteractor.offlineIndex(Task.self, filter: "isDone = false") as! [Task]
        configureTableView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped(sender: UIBarButtonItem) {
        let vc = TaskDetailsViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.tabBarController?.present(vc, animated:true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ToDoViewController: TaskDetailsDelegate {
    func didFinishEditingTask(task: Task?) {
        guard let task = task else {
            return
        }
        appendTask(task.copy() as! Task)
        task.save()
    }
}

extension ToDoViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
    }
    
    func registerCells() {
        let cells : [UITableViewCell.Type] = [ToDoTableViewCell.self]
        cells.forEach { cell in
            let cellName = String(describing: cell.self)
            let nib = UINib(nibName: cellName, bundle: nil)
            tableView?.register(nib, forCellReuseIdentifier: cellName)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //TODO: sections by date //Today // tomorrow //etc
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName = String(describing: ToDoTableViewCell.self)
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellName) as! ToDoTableViewCell
        cell.configure(task: tasks[indexPath.row])
        return cell
    }
}

extension ToDoViewController {
    
    func appendTask(_ task: Task) {
        tableView.beginUpdates()
        self.tasks.append(task)
        tableView.insertRows(at: [IndexPath(row: tasks.count-1, section: 0)], with: .left)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteButton = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "Delete") { action, indexPath in
            self.deleteTask(indexPath: indexPath)
        }
        deleteButton.backgroundColor = .red
        
        let doneButton = UITableViewRowAction(style: .default, title: "Done 💃🏻") { action, indexPath in
            self.markTaskAsDone(indexPath: indexPath)
        }
        doneButton.backgroundColor = .green
        return [doneButton, deleteButton]
    }
    
    private func markTaskAsDone(indexPath: IndexPath) {
        TaskInteractor.markTaskDone(tasks[indexPath.row])
        tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .right)
    }
    
    private func deleteTask(indexPath: IndexPath) {
        TaskInteractor.deleteTask(tasks[indexPath.row])
        tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .right)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    }
    
}
