//
//  ViewController.swift
//  ScrollingSmooth
//
//  Created by Samuel Goodwin on 3/21/19.
//  Copyright © 2019 Samuel Goodwin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var data = [String]()
    
    func randomWord() -> String {
        let alphabet =  "abcdefghijklmnopqrstuvwxyz"
        var result = String()
        
        for _ in 0..<10 {
            if let character = alphabet.randomElement() {
                result.append(character)
            }
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10_000_000 {
            data.append(randomWord())
        }
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }

}

