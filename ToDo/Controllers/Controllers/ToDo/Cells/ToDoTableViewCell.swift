//
//  ToDoTableViewCell.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/12/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var sideColorView: UIView!
    
    var task: Task?
    
    let colors = [UIColor.wetAsphalt, .peterRiver, .alizarin, .greenSea, .westiria, UIColor.pink, UIColor.lightBlue, UIColor.lime, UIColor.indigo]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        task = nil
    }
    
    func configure(task: Task) {
        self.task = task
        taskLabel.text = task.text
        
        let selectedColor: UIColor = colors.random()
        self.sideColorView.backgroundColor = selectedColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
