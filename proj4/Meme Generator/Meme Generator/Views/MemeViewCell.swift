//
//  MemeCollectionViewCell.swift
//  Meme Generator
//
//  Created by Joel Graycar on 12/7/15.
//  Copyright © 2015 Joel Graycar. All rights reserved.
//

import UIKit
import CoreData

class MemeViewCell: UICollectionViewCell {
    @IBOutlet weak var memeImage: UIImageView!
    var meme: NSManagedObject? = nil
}
