//
//  DetailViewController.swift
//  RetainCycle
//
//  Created by Nic Laughter on 3/23/19.
//  Copyright © 2019 demo.demo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailLabel: UILabel!
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let master = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! MasterTableViewController
        self.present(master, animated: true, completion: nil)
    }
}
