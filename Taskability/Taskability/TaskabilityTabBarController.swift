//
//  TaskabilityTabBarController.swift
//  Taskability
//
//  Created by Connor Krupp on 16/03/2016.
//  Copyright © 2016 Connor Krupp. All rights reserved.
//

import UIKit

class TaskabilityTabBarController: UITabBarController, UITabBarControllerDelegate {

    var dataController: DataController!

    override func viewDidLoad() {
        let navigationController = viewControllers?.first as? UINavigationController
        let taskGroupsViewController = navigationController?.viewControllers.first as? TaskGroupsTableViewController
        taskGroupsViewController?.dataController = dataController
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        self.delegate = self

        var tabBarFrame = tabBar.frame
        tabBarFrame.size.height = 67
        tabBarFrame.origin.y = view.frame.size.height - 67
        tabBar.frame = tabBarFrame

        if let tabBarItems = tabBar.items {
            let addTaskTabBarImage = UIImage(named: "AddTaskItemTab")?.imageWithRenderingMode(.AlwaysOriginal)
            let centerItemIndex = tabBarItems.count / 2 // Integer division, 5/2 == 2 -> center of 5 elements
            tabBarItems[centerItemIndex].image = addTaskTabBarImage
            tabBarItems[centerItemIndex].selectedImage = addTaskTabBarImage
        }
    }

    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if tabBar.selectedItem?.tag == 100 {
            performSegueWithIdentifier("addTaskItem", sender: self)
            return false
        }
        return true
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addTaskItem" {
            let addTaskNavigationController = segue.destinationViewController as! UINavigationController
            let addTaskViewController = addTaskNavigationController.viewControllers.first as! AddTaskTableViewController
            addTaskViewController.dataController = dataController
        }
    }

}
