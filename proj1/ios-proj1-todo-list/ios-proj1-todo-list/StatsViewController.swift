//
//  StatsViewController.swift
//  ios-proj1-todo-list
//
//  Created by Joel Graycar on 10/12/15.
//  Copyright © 2015 Joel Graycar. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var numCompleted: UILabel!
    var numCompletedText = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.numCompleted.text = numCompletedText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
