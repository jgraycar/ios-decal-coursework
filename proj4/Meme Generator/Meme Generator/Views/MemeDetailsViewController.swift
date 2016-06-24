//
//  MemeDetailsViewController.swift
//  Meme Generator
//
//  Created by Joel Graycar on 12/7/15.
//  Copyright © 2015 Joel Graycar. All rights reserved.
//

import UIKit
import CoreData

class MemeDetailsViewController: UIViewController {
    var meme: NSManagedObject? = nil

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var createdLabel: UILabel!
    
    var shareButton: FBSDKShareButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let resizedImage = imageResize(UIImage(data: meme!.valueForKey("image") as! NSData)!, sizeChange: size)
        
        imageView.image = resizedImage

        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        createdLabel.text = formatter.stringFromDate(meme!.valueForKey("created") as! NSDate)
        
        shareButton = FBSDKShareButton()
        let photo = FBSDKSharePhoto()
        photo.image = resizedImage
        photo.userGenerated = true
        
        let content = FBSDKSharePhotoContent()
        content.photos = [photo]
        shareButton.shareContent = content
        
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        let offset = height - width
        shareButton.frame = CGRectMake(width / 2.0 - width / 15.0,
            width + offset * 0.5,
            width / 5.5,
            width / 15.0)
        self.view.addSubview(shareButton)
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
    
    func deleteMeme() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        managedContext.deleteObject(meme!)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not delete \(error), \(error.userInfo)")
        } catch {
            print("Error while trying to delete meme")
        }
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "deleteMeme" {
            deleteMeme()
        }
    }

}
