//
//  CreateMemeViewController.swift
//  Meme Generator
//
//  Created by Joel Graycar on 12/7/15.
//  Copyright © 2015 Joel Graycar. All rights reserved.
//

import UIKit
import CoreData

let size = CGSizeMake(250, 250)
    
class CreateMemeViewController: UIViewController, UITextFieldDelegate {
    
    var image: UIImage? = nil
    var keyboardRaised: Bool = false
    var keyboardHeight: CGFloat!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var upperTextField: UITextField!
    @IBOutlet weak var lowerTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = imageResize(image!, sizeChange: size)
        
        upperTextField.delegate = self
        lowerTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageResize(image:UIImage, sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Have keyboard close when return entered
        textField.resignFirstResponder()
        
        return true
    }
    
    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize =  (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                keyboardHeight = keyboardSize.height
                self.animateTextField(true)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.animateTextField(false)
    }
    
    func animateTextField(up: Bool) {
        // Raise frame up when keyboard opens
        if keyboardHeight != nil && keyboardRaised != up {
            let movement = (up ? -keyboardHeight : keyboardHeight)
        
            UIView.animateWithDuration(0.3, animations: {
                self.view.frame = CGRectOffset(self.view.frame, 0, movement)
            })
            
            // Prevent raising the height of the frame multiple times
            keyboardRaised = up
        }
    }
    
    func addTextToImage(image:UIImage, text: String, pointof: CGPoint) -> UIImage{
        
        //let font:UIFont = UIFont.boldSystemFontOfSize(12)
        let font: UIFont = UIFont(name: "Avenir-Black", size: 35.0)!
        
        let white: UIColor = UIColor.whiteColor()
        let black: UIColor = UIColor.blackColor()
        let dict: NSDictionary = [NSFontAttributeName : font,
            NSStrokeColorAttributeName : black,
            NSForegroundColorAttributeName : white,
            NSStrokeWidthAttributeName : -3.0]
        
        UIGraphicsBeginImageContext(image.size)
        image.drawInRect(CGRectMake(0, 0, image.size.width, image.size.height))
        let rect: CGRect = CGRectMake(pointof.x, pointof.y, image.size.width, image.size.height)
        text.drawInRect(CGRectIntegral(rect), withAttributes:dict as? [String : AnyObject])
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func saveMeme() {
        var imageWithText = addTextToImage(imageView.image!, text: upperTextField.text!, pointof: CGPointMake(5, 0))
        imageWithText = addTextToImage(imageWithText, text: lowerTextField.text!, pointof: CGPointMake(5, 205))
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("Meme", inManagedObjectContext:managedContext)
        let meme = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        meme.setValue(upperTextField.text, forKey: "upperText")
        meme.setValue(lowerTextField.text, forKey: "lowerText")
        meme.setValue(NSDate(), forKey: "created")
        meme.setValue(UIImagePNGRepresentation(imageWithText), forKey: "image")
        

        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            print("Could not save meme")
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveMeme" {
            saveMeme()
        }
    }

}
