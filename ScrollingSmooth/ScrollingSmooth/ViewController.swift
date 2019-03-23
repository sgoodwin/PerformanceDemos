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
    let namesQueue = DispatchQueue(label: "demo.demo.ScrollingSmooth.names", qos: .background)
    let semaphore = DispatchSemaphore(value: 1)
    
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
        
        namesQueue.async { [weak self] in
            guard let self = self else { return }
            for _ in 0..<10_000_000 {
                self.semaphore.wait()
                self.data.append(self.randomWord())
                self.semaphore.signal()
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        semaphore.wait()
        let count = data.count
        semaphore.signal()
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.semaphore.wait()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        self.semaphore.signal()
        return cell
    }
    
}

