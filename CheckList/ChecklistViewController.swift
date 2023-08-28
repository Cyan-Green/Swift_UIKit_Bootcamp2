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
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Do any additional setup after loading the view.
        let item1 = ChecklistItem(text: "Walk the dog",checked: false)
        let item2 = ChecklistItem(text:"Brush my teeth" ,checked: true)
        let item3 = ChecklistItem(text: "Learn iOS development",checked: true)
        let item4 = ChecklistItem(text: "Soccer practice",checked: false)
        let item5 = ChecklistItem(text: "Eat ice cream",checked: true)
        
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item5)
        
    }
    
    func configureText(for cell: UITableViewCell,with item: ChecklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func configureCheckmark(for cell: UITableViewCell,with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
    }
    
    // MARK: - Actions
    @IBAction func addItem(){
        
        let newRowIndex = items.count
        let item = ChecklistItem()
        item.text = "I am a new row"
        items.append(item)
       
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return items.count
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
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
            configureCheckmark(for: cell,with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at:  indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }

    
}

