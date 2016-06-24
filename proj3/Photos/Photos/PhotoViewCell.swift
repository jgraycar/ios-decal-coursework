//
//  PhotoViewCell.swift
//  Photos
//
//  Created by Joel Graycar on 11/17/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    var photo: Photo?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.photo = nil
    }

}
