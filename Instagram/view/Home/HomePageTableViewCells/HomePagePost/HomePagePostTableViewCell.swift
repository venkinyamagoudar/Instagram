//
//  HomePagePostTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/24/22.
//

import UIKit

class HomePagePostTableViewCell: UITableViewCell {

    @IBOutlet weak var postedUserName: UILabel!
    @IBOutlet weak var postedUserProfile: UIImageView!
    @IBOutlet weak var postedImageName: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
