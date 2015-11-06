//
//  AllListsViewController.swift
//  CheckCheckDone
//
//  Created by G.D. Sanders on 11/6/15.
//  Copyright © 2015 DigitalEquity, Inc. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = cellForTableView(tableView)
        cell.textLabel!.text = "List \(indexPath.row)"
        return cell

        
    }
    
    func cellForTableView(tableView: UITableView) -> UITableViewCell { let cellIdentifier = "Cell"
        if let cell =
        tableView.dequeueReusableCellWithIdentifier(cellIdentifier) { return cell
        } else {
            return UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
    }
    

   
}
