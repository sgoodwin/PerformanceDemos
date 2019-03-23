//
//  MasterTableViewController.swift
//  RetainCycle
//
//  Created by Nic Laughter on 3/23/19.
//  Copyright © 2019 demo.demo. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView: DetailViewController = UIStoryboard(name: "Detail", bundle: nil).instantiateInitialViewController() as! DetailViewController
        detailView.loadViewIfNeeded()
        detailView.detailLabel.text = "\(indexPath.row)"
        self.present(detailView, animated: true, completion: nil)
    }
}

