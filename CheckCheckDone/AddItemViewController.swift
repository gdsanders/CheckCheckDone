//
//  AddItemViewController.swift
//  CheckCheckDone
//
//  Created by G.D. Sanders on 11/2/15.
//  Copyright © 2015 DigitalEquity, Inc. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: AddItemViewController); func addItemViewController(controller: AddItemViewController,
    didFinishAddingItem item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
        
    weak var delegate: AddItemViewControllerDelegate?
        
    var itemToEdit:  ChecklistItem?
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
        
    override func viewDidLoad() {
            super.viewDidLoad()
           
            if let item = itemToEdit {
                title = "Edit Item"
                textField.text = item.text
            }
        }
        
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: IBActions
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(sender: UIBarButtonItem) {
            
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.addItemViewController(self, didFinishAddingItem: item)
        
    }
    
    // MARK: Text field delegate method
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        doneBarButton.enabled = (newText.length > 0)
        
        return true
    }
    
}

