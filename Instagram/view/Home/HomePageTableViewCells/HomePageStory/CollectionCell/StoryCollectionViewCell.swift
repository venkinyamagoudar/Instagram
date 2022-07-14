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
    weak var storyImageTapDelegate: StoryTappableDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.isUserInteractionEnabled = true
        let tapRecogniser = UITapGestureRecognizer(target: self, action: #selector(storyPressed(tapGestureRecognizer: )))
        userImage.addGestureRecognizer(tapRecogniser)
        
    }
    
    @objc func storyPressed(tapGestureRecognizer: UITapGestureRecognizer) {
        self.storyImageTapDelegate?.didTapStoryCell(with: self.storyImage!)
    }
}
