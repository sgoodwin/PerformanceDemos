//
//  ChildViewController.swift
//  ActuallyRetainCycles
//
//  Created by Nic Laughter on 3/23/19.
//  Copyright © 2019 demo.demo. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    
    @IBOutlet var tryImageView: UIImageView!
    var navController: UINavigationController = UINavigationController()
    var mainViewController: ViewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(animateTryImageView))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func animateTryImageView() {
        UIView.animate(withDuration: 0.25, animations: {
            self.tryImageView.alpha = self.mainViewController.hidden ? 1 : 0
        }) { _ in
            self.mainViewController.hidden = !self.mainViewController.hidden
        }
    }
}
