//
//  ToDoItem.swift
//  ios-proj1-todo-list
//
//  Created by Joel Graycar on 10/12/15.
//  Copyright © 2015 Joel Graycar. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var itemName: NSString = ""
    var completed: Bool = false
    var creationDate: NSDate = NSDate()
    var completionDate: NSDate? = nil
    
    init(name:String) {
        self.itemName = name
    }

}
