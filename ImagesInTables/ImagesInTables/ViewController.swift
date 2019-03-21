//
//  ViewController.swift
//  ImagesInTables
//
//  Created by Samuel Goodwin on 3/21/19.
//  Copyright © 2019 Samuel Goodwin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.imageView?.image = UIImage(data: try! Data(contentsOf: URL(string: "https://via.placeholder.com/150.png?text=Demo+desu!")!))
        cell.textLabel?.text = "row \(indexPath.row)"
        
        return cell
    }

}

