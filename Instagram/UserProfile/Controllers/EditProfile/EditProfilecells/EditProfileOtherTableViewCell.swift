//
//  EditProfileOtherTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

class EditProfileOtherTableViewCell: UITableViewCell {

    @IBOutlet weak var firstLabel: UILabel!
    
    static let identifier = "EditProfileOtherTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "EditProfileOtherTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
