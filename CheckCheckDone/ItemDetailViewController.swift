//
//  ItemDetailViewController.swift
//  CheckCheckDone
//
//  Created by G.D. Sanders on 11/2/15.
//  Copyright © 2015 DigitalEquity, Inc. All rights reserved.
//

import Foundation
import UIKit

protocol ItemDetailViewControllerDelegate: class {
    
    func itemDetailViewControllerDidCancel(controller: ItemDetailViewController)
    
    func itemDetailViewController(controller: ItemDetailViewController,
    didFinishAddingItem item: ChecklistItem)
    
    func itemDetailViewController(controller: ItemDetailViewController, didFinishEditingItem item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
        
    weak var delegate: ItemDetailViewControllerDelegate?
        
    var itemToEdit:  ChecklistItem?
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
        
    override func viewDidLoad() {
           
            super.viewDidLoad()
           
            if let item = itemToEdit {
                title = "Edit Item"
                textField.text = item.text
                doneBarButton.enabled = true
            }
        }
        
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: IBActions for Cancel and Done
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done(sender: UIBarButtonItem) {
            
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditingItem: item)
        
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.itemDetailViewController(self, didFinishAddingItem: item)
        }
    }
    
    // MARK: Text field delegate method
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        doneBarButton.enabled = (newText.length > 0)
        
        return true
    }
    
}

