//
//  CartTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/5/22.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static var identifier = "CartCell"
    static func nib() -> UINib {
        return UINib(nibName: "CartTableViewCell", bundle: nil)
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
