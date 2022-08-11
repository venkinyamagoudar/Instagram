//
//  OtherStoryCollectionViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/11/22.
//

import UIKit

class OtherStoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var storyCollectionImageView: UIImageView!
    @IBOutlet weak var storyCollectionHeading: UILabel!
    
    static var identifier = "OtherStoryCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "OtherStoryCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        storyCollectionImageView.layer.borderWidth = 1
        storyCollectionImageView.layer.borderColor = UIColor.white.cgColor
        storyCollectionImageView.layer.masksToBounds = true
        storyCollectionImageView.layer.cornerRadius = storyCollectionImageView.frame.height / 2
        
    }

}
