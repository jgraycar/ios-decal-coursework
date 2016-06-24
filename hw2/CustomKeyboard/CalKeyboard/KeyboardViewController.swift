//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var insertPoopButton: UIButton!
    @IBOutlet var insertPeeButton: UIButton!
    @IBOutlet var returnButton: UIButton!
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    func deleteCharacter() {
        self.textDocumentProxy.deleteBackward()
    }
    
    func insertPoop() {
        self.textDocumentProxy.insertText("poop ")
    }
    
    func insertPee() {
        self.textDocumentProxy.insertText("pee ")
    }
    
    func insertNewline() {
        self.textDocumentProxy.insertText("\n")
        dismissKeyboard()
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        deleteButton.addTarget(self, action: "deleteCharacter", forControlEvents: .TouchUpInside)
        insertPoopButton.addTarget(self, action: "insertPoop", forControlEvents: .TouchUpInside)
        insertPeeButton.addTarget(self, action: "insertPee", forControlEvents: .TouchUpInside)
        returnButton.addTarget(self, action: "insertNewline", forControlEvents: .TouchUpInside)
    }


}
