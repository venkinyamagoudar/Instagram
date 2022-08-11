//
//  FollowingButtonCollectionViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/22/22.
//



import UIKit

class FollowingButtonCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var buttonLabel: UILabel!
    
    static var identifier = "FollowingButtonCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FollowingButtonCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
