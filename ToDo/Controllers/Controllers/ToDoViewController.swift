//
//  ToDoViewController.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/11/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    }
    
    func registerCells() {
        let cells : [UITableViewCell] = []
        cells.forEach { cell in
            let cellName = String(describing: cell.self)
            let nib = UINib(nibName: cellName, bundle: nil)
            tableView?.register(nib, forCellReuseIdentifier: cellName)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 //TODO: sections by date //Today // tomorrow //etc
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellName = String(describing: UITableViewCell.self)
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellName) as! UITableViewCell
        return cell
    }
    
}
