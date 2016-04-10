//
//  PhotosCollectionViewCell.swift
//  Photos
//
//  Created by Nhi Quach on 4/5/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }

    
}
