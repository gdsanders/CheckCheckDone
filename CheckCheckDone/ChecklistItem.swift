//
//  ChecklistItem.swift
//  CheckCheckDone
//
//  Created by G.D. Sanders on 11/2/15.
//  Copyright © 2015 DigitalEquity, Inc. All rights reserved.
//

import Foundation

class ChecklistItem {
    
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
}

