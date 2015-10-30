//
//  ViewController.swift
//  CheckCheckDone
//
//  Created by G.D. Sanders on 10/30/15.
//  Copyright © 2015 DigitalEquity, Inc. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Jump down, turn around"
        } else if indexPath.row == 1 {
            label.text = "Sweet Caroline"
        } else if indexPath.row == 2 {
            label.text = "Waz up?"
        } else if indexPath.row == 3 {
            label.text = "I love posole"
        } else if indexPath.row == 4 {
            label.text = "Boomer Sooner!"
        }
        
        return cell
    }


}
