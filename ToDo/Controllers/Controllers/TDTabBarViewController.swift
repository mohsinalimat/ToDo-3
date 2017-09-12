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
        styleTabBarItem(doneNavController, title: "Done", image: UIImage(named: "todo")!)
        
        viewControllers = [todoNavController,doneNavController]
    }
    
    private func styleTabBarItem(_ viewController: UIViewController, title: String, image: UIImage) {
        let newSize = CGSize(width: 20, height: 20)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = newImage
        
        if #available(iOS 10.0, *) {
            viewController.tabBarItem.badgeColor = .red
        }
    }
}
