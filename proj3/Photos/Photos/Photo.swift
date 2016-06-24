//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var thumbnailUrl : String!
    var fullUrl : String!
    /* The username of the photographer. */
    var username : String!
    /* The upload time of this photo. */
    var uploadDate : NSDate!
    var userLike : Int!

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        likes = data.valueForKey("likes")?.valueForKey("count") as! Int
        username = data.valueForKey("user")?.valueForKey("username") as! String
        uploadDate = NSDate(timeIntervalSince1970: Double(data.valueForKey("created_time") as! String)!)
        thumbnailUrl = data.valueForKey("images")?.valueForKey("thumbnail")?.valueForKey("url") as! String
        fullUrl = data.valueForKey("images")?.valueForKey("low_resolution")?.valueForKey("url") as! String
        userLike = 0
    }
    
    func likeText() -> String! {
        if userLike == 0 {
            //return "Like"
            return "♥"
        }
        return "💔"
    }
    
    func likeCount() -> Int! {
        return likes + userLike
    }

    func likePhoto() {
        userLike = (userLike + 1) % 2
    }
}