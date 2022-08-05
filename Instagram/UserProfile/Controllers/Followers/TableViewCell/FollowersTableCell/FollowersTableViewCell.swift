//
//  FollowersTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/19/22.
//

import UIKit

class FollowersTableViewCell: UITableViewCell {
    
    static var identifier = "FollowersTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "FollowersTableViewCell", bundle: nil)
    }

    @IBOutlet weak var profilePhotoView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profilePhotoView.backgroundColor = .orange
        
        profilePhotoView.layer.masksToBounds = true
        profilePhotoView.layer.borderWidth = 1
        profilePhotoView.layer.borderColor = UIColor.white.cgColor
        profilePhotoView.layer.cornerRadius = profilePhotoView.frame.width / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func removeFollowerButtonTapped(_ sender: Any) {
        print("remove button")
    }
    
}
