//
//  PhotoViewController.swift
//  Photos
//
//  Created by Nhi Quach on 4/7/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeIcon: UIImageView!
    var photo: Photo!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageViewSize()
        self.view.addSubview(self.imageView)
        loadImage(photo, imageView: imageView)
        self.usernameLabel.text = photo.username
        self.likesLabel.text = "👍" + String(photo.likes)
        self.datePostedLabel.text = getDatePosted()
        

        let tap = UITapGestureRecognizer(target: self, action:Selector("onDoubleTap:"))
        tap.numberOfTapsRequired = 2
        view.userInteractionEnabled = true
        view.addGestureRecognizer(tap)
        self.view.bringSubviewToFront(likeIcon)
        likeIcon?.hidden = true
    }
    
    func onDoubleTap(sender:AnyObject) {
        likeIcon?.hidden = false
        likeIcon?.alpha = 1.0
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: UIViewAnimationOptions.TransitionNone, animations: {
            
            self.likeIcon?.alpha = 0
            
            }, completion: {
                (value:Bool) in
                
                self.likeIcon?.hidden = true
        })
        self.likesLabel.text = "👍" + String(photo.likes + 1)
    }
    
    func getDatePosted() -> String {
        let date = NSDate(timeIntervalSince1970: NSTimeInterval(Int(photo.createdTime)!))
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        return dateFormatter.stringFromDate(date)
        
    }
    
    
    func loadImage(photo: Photo, imageView: UIImageView) {
        let url = NSURL(string: photo.url)
        let data = NSData(contentsOfURL: url!)
        let img = UIImage(data: data!)
        imageView.image = img
    }
    
    func configureImageViewSize() {
        let screen = self.view.bounds
        let totalHeight: CGFloat = screen.width
        let totalWidth: CGFloat = screen.width
        
        self.imageView.frame = CGRectMake(0.0, 0.0, totalWidth, totalHeight)
        self.imageView.bounds = CGRectMake(0.0, 0.0, totalWidth, totalHeight)
    }

    
    
    
    
    
}
