//
//  ViewController.swift
//  CheckList
//
//  Created by Misty on 2023/8/28.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var item1 = ChecklistItem(text: "Walk the dog",checked: false)
        var item2 = ChecklistItem(text:"Brush my teeth" ,checked: true)
        var item3 = ChecklistItem(text: "Learn iOS development",checked: true)
        var item4 = ChecklistItem(text: "Soccer practice",checked: false)
        var item5 = ChecklistItem(text: "Eat ice crea,",checked: true)
        
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item5)
    
        
    }
    
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell,with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
            configureCheckmark(for: cell,with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureText(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func configureCheckmark(
        for cell: UITableViewCell,
        with item: ChecklistItem
    ) {
        if item.checked {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
    }
}

