//
//  DiscoverPeopleCollectionViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/20/22.
//

import UIKit

class DiscoverPeopleCollectionViewCell: UICollectionViewCell {

    
    static var identifier = "DiscoverPeopleCollectionReusableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "DiscoverPeopleCollectionReusableView", bundle: nil)
    }
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var listOfPeopleFollowing: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
    }
    
    
    @IBAction func crossButtonPressed(_ sender: Any) {
        
    }
    
    
    @IBAction func followButtonTapped(_ sender: Any) {
    }
    
}
