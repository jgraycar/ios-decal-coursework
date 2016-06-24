//
//  ViewController.swift
//  ios-proj1-todo-list
//
//  Created by Joel Graycar on 10/12/15.
//  Copyright © 2015 Joel Graycar. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var toDoItem: ToDoItem?
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if sender as? NSObject != self.saveButton{
            return
        }
        if self.textField.text!.characters.count > 0 {
            self.toDoItem = ToDoItem(name: self.textField.text!)
        }
    }

}

