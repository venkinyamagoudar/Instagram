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
    
    var discoverPeopleCollectionCellViewModel = DiscoverPeopleCollectionCellViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        
        discoverPeopleCollectionCellViewModel.setImageView(profileImageView)
        
        
//        profileImageView.layer.borderWidth = 1
//        profileImageView.layer.borderColor = UIColor.white.cgColor
//        profileImageView.layer.masksToBounds = true
//        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
    }
    
    @IBAction func crossButtonPressed(_ sender: Any) {
        print("removed the cell")
    }
    
    
    @IBAction func followButtonTapped(_ sender: Any) {
        print("Follow the user")
    }
    
}
