//
//  FollowingTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/19/22.
//

import UIKit

class FollowingTableViewCell: UITableViewCell {

    
    static var identifier = "FollowingTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "FollowingTableViewCell", bundle: nil)
    }
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func followingButtonTapped(_ sender: Any) {
        print("follow tapped")
    }
    
}
