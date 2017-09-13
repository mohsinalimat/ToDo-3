//
//  TDTabBarViewController.swift
//  ToDo
//
//  Created by Mohamed Hamed on 9/12/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class TDTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .red
        addControllers()
    }
    
    private func addControllers() {
        let todoNavController = UINavigationController(rootViewController: ToDoViewController())
        styleTabBarItem(todoNavController, title: "ToDo", image: UIImage(named: "todo")!)
        
        let doneNavController = UINavigationController(rootViewController: DoneViewController())
        styleTabBarItem(doneNavController, title: "Done", image: UIImage(named: "done")!)
        
        viewControllers = [todoNavController, doneNavController]
    }
    
    private func styleTabBarItem(_ viewController: UIViewController, title: String, image: UIImage) {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        if #available(iOS 10.0, *) {
            viewController.tabBarItem.badgeColor = .red
        }
    }
}
