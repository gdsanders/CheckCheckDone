//
//  AddItemViewController.swift
//  CheckCheckDone
//
//  Created by G.D. Sanders on 11/2/15.
//  Copyright © 2015 DigitalEquity, Inc. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UITableViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: IBActions
    
    @IBAction func cancel(sender: UIBarButtonItem) {
      dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done(sender: UIBarButtonItem) {
        
        print("Contents of the text field: \(textField.text!)")
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
}

