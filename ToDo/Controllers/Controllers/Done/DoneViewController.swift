//
//  DoneViewController.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/12/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class DoneViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks = [Task]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Done"
        configureTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tasks  = TaskInteractor.offlineIndex(Task.self, filter: "isDone = true") as! [Task]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension DoneViewController: UITableViewDelegate, UITableViewDataSource {
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName = String(describing: ToDoTableViewCell.self)
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellName) as! ToDoTableViewCell
        cell.configure(task: tasks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: UITableViewRowActions
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteButton = UITableViewRowAction(style: UITableViewRowActionStyle.destructive, title: "Delete") { action, indexPath in
            self.deleteTask(indexPath: indexPath)
        }
        deleteButton.backgroundColor = .red
        
        let todoButton = UITableViewRowAction(style: .default, title: "ToDo 🤦‍♂️") { action, indexPath in
            self.markTaskAsDone(indexPath: indexPath)
        }
        todoButton.backgroundColor = .green
        return [deleteButton, todoButton]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
}

extension DoneViewController {
    private func markTaskAsDone(indexPath: IndexPath) {
        TaskInteractor.markTaskDone(tasks[indexPath.row], done: false)
        tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .right)
    }
    
    private func deleteTask(indexPath: IndexPath) {
        TaskInteractor.deleteTask(tasks[indexPath.row])
        tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .right)
    }
}
