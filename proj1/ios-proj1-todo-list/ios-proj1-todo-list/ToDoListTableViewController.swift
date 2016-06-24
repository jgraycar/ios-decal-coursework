//
//  ToDoListTableViewController.swift
//  ios-proj1-todo-list
//
//  Created by Joel Graycar on 10/12/15.
//  Copyright © 2015 Joel Graycar. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var toDoItems = [ToDoItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove the entries completed over 24 hours ago
        var oldItems = [Int]()
        for (index, item) in self.toDoItems.enumerate() {
            if item.completed {
                let elapsedTime = NSDate().timeIntervalSinceDate(item.completionDate!)
                if elapsedTime < (24 * 60 * 60) {
                    oldItems.append(index)
                }
            }
        }
        for index in oldItems {
            self.toDoItems.removeAtIndex(index)
        }

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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.toDoItems.count
    }
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController
        if source.isKindOfClass(AddToDoViewController) {
            let item: ToDoItem? = (source as! AddToDoViewController).toDoItem
            
            if item != nil {
                self.toDoItems.append(item!)
                self.tableView.reloadData()
            }
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell")!

        let todoitem: ToDoItem = self.toDoItems[indexPath.row]

        cell.textLabel?.text = todoitem.itemName as String

        if todoitem.completed {
            cell.accessoryType = .Checkmark
        } else{
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let tappedItem: ToDoItem = self.toDoItems[indexPath.row]
            
        tappedItem.completed = !tappedItem.completed
        if tappedItem.completed {
            tappedItem.completionDate = NSDate()
        } else {
            tappedItem.completionDate = nil
        }
            
        tableView.reloadData()
            
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToStats" {
            let nav = segue.destinationViewController as! StatsViewController
            var numComplete = 0
            
            for item in self.toDoItems {
                if item.completed {
                    let elapsedTime = NSDate().timeIntervalSinceDate(item.completionDate!)
                    if elapsedTime < (24 * 60 * 60) {
                        numComplete += 1
                    }
                }
            }
            
            nav.numCompletedText = String(numComplete)
        }
    }

}
