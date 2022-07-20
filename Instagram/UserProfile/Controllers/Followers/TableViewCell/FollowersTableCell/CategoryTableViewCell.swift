//
//  CategoryTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/19/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static var identifier = "CategoryTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CategoryTableViewCell", bundle: nil)
    }

    @IBOutlet weak var followBackImageView: UIImageView!
    @IBOutlet weak var listOfToBeFollowedLabel: UILabel!
    
    @IBOutlet weak var leastContactedImageView: UIImageView!
    @IBOutlet weak var listOfPeopleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
