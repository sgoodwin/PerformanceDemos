//
//  ViewController.swift
//  ActuallyRetainCycles
//
//  Created by Nic Laughter on 3/23/19.
//  Copyright © 2019 demo.demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var hiddenSwitch: UISwitch!
    var hidden: Bool = false
    var childViewController: ChildViewController = ChildViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showChild))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        self.childViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Child") as! ChildViewController
        self.childViewController.loadViewIfNeeded()
    }

    @IBAction func hiddenSwitchToggled(_ sender: Any) {
    }
    
    @objc func showChild() {
        self.childViewController.navController = self.navigationController!
        self.childViewController.mainViewController = self
        navigationController?.present(self.childViewController, animated: true, completion: nil)
    }
}

