//
//  EditProfileTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

class EditProfileTableViewCell: UITableViewCell {
    
    static let identifier = "EditProfileTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "EditProfileTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
}
