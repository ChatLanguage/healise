//
//  CustomSplitViewController.swift
//  MyBujo2.0
//
//  Created by Lucas Tavares on 20/08/19.
//  Copyright © 2019 Gabriel Palhares. All rights reserved.
//

import UIKit

class CustomSplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let controllers = [MasterViewController(),MyTodayViewController(),MyJourneyViewController()]
        var navigationControllers = controllers.map({ (controller) -> UINavigationController in
            let nav = UINavigationController(rootViewController: controller)
            controller.navigationController?.navigationBar.isHidden = true
            return nav
        })
        
        // tirei o force cast: by palhares
        
        if let masterViewController = controllers.first as? MasterViewController {
            masterViewController.viewControllers = [navigationControllers[1], navigationControllers[2]]
        }
        
        self.viewControllers = [navigationControllers[0], navigationControllers[1]]
        
        self.preferredPrimaryColumnWidthFraction = 0.2
        self.setValue(0.0, forKey: "gutterWidth")
    }
}
