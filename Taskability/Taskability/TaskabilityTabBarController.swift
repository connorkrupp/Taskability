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
        passDataControllerToViewControllerAtIndex(0)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        self.delegate = self
    }

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        passDataControllerToViewControllerAtIndex(tabBarController.selectedIndex)
    }

    func passDataControllerToViewControllerAtIndex(index: Int) {
        let navigationController = viewControllers?[index] as? UINavigationController
        switch index {
        case 1:
            let stagingAreaViewController = navigationController?.viewControllers.first as? StagingAreaTableViewController
            stagingAreaViewController?.dataController = dataController
        default:
            break
        }
    }
}
