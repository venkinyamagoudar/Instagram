//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/27/22.
//

import UIKit

protocol StoryTappableDelegate : AnyObject {
    func didTapStoryCell(with image: UIImage)
}

class StoryCollectionViewCell: UICollectionViewCell {

//    static var identifier = "StoryCollectionViewCell"
//
//    static func nib() -> UINib {
//        return UINib(nibName: "StoryCollectionViewCell", bundle: nil)
//    }
    @IBOutlet var userProfile: UILabel!
    
    @IBOutlet var userImage: UIImageView!
    
    var storyImage = UIImage(named: "message")
    
    //let nc = UINavigationController()
    public weak var storyImageTapDelegate: StoryTappableDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.isUserInteractionEnabled = true
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(storyPressed(tapGestureRecognizer: )))
        userImage.addGestureRecognizer(tapRecogniser)
        
        
        userImage?.layer.cornerRadius = (userImage?.frame.size.height ?? 0.0) / 2
        userImage?.clipsToBounds = true
        userImage?.layer.borderWidth = 3.0
        userImage.layer.borderColor = UIColor.blue.cgColor
        
        
        
    }
    
    @objc func storyPressed(tapGestureRecognizer: UITapGestureRecognizer) {
        self.storyImageTapDelegate?.didTapStoryCell(with: self.storyImage!)
        userImage.layer.borderColor = UIColor.gray.cgColor
    }
}