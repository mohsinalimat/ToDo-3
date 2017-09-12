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
        viewControllers = [todoNavController]
        styleTabBarItem(0, title: "Pending", image: UIImage(named: "todo")!)
    }
    
    private func styleTabBarItem(_ index: Int, title: String, image: UIImage) {
        let newSize = CGSize(width: 20, height: 20)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        viewControllers?[index].tabBarItem.title = title
        viewControllers?[index].tabBarItem.image = newImage
        
        if #available(iOS 10.0, *) {
            viewControllers?[index].tabBarItem.badgeColor = .red
        }
    }
}
