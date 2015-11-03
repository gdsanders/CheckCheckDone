//
//  ViewController.swift
//  CheckCheckDone
//
//  Created by G.D. Sanders on 10/30/15.
//  Copyright © 2015 DigitalEquity, Inc. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items: [ChecklistItem]
    
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        let row0item = ChecklistItem()
        row0item.text = "Where's my posole?"
        row0item.checked = false
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "Good quail season"
        row1item.checked = true
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "Did beerDidLoad?"
        row2item.checked = false
        items.append(row2item)
        
        let row3item = ChecklistItem()
        row3item.text = "Green Chile Cheeseburger"
        row3item.checked = true
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "Fly fishing Colorado"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:  Tableview Delegates
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
        
        let item = items[indexPath.row]
        
        configureTextForCell(cell, withChecklistItem: item)
        configureCheckmarkForCell(cell, withChecklistItem: item)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let item = items[indexPath.row]
            
            
            item.toggleChecked()
            configureCheckmarkForCell(cell, withChecklistItem: item)        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    

    @IBAction func addItem(sender: UIBarButtonItem) {
        let newRowIndex = items.count
        let item = ChecklistItem()
        item.text = "I am a new row"
        item.checked = false
        items.append(item)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    
// MARK: Helper methods
    
    
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        
        if item.checked {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
    }
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }

}
