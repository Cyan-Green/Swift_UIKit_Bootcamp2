//
//  ChecklistItem.swift
//  CheckList
//
//  Created by Misty on 2023/8/28.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    init(text: String = "", checked: Bool = false) {
        self.text = text
        self.checked = checked
    }
}
