//
//  PhotoDetailsViewController.swift
//  Photos
//
//  Created by Joel Graycar on 11/17/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    var photo: Photo!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var uploadDateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var numLikesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //loadImage()
        usernameLabel.text = photo.username
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        uploadDateLabel.text = formatter.stringFromDate(photo.uploadDate)
        let url = NSURL(string: photo.fullUrl)
        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        photoImage.image = UIImage(data: data!)
        likeButton.addTarget(self, action: "likePhoto", forControlEvents: .TouchUpInside)
        updateLikes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func likePhoto() {
        photo.likePhoto()
        updateLikes()
    }
    
    func updateLikes() {
        likeButton.setTitle(photo.likeText(), forState: UIControlState.Normal)
        numLikesLabel.text = String(photo.likeCount())
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func loadImage() {
        // Download an NSData representation of the image at the URL
        let url = NSURL(string: photo.thumbnailUrl)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {
            (data, response, error) -> Void in
            if error == nil {
                self.photoImage.image = UIImage(data: data!)
            }
        })
        task.resume()
    }

}
