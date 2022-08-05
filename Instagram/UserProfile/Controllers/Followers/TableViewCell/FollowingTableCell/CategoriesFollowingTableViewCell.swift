//
//  CategoriesFollowingTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/20/22.
//

import UIKit

class CategoriesFollowingTableViewCell: UITableViewCell {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var leastInteractedUIView: UIView!
    @IBOutlet weak var leastInteractedImageView: UIImageView!
    @IBOutlet weak var leastInteractedLabel: UILabel!
    
    @IBOutlet weak var mostInteractedPeopleUIView: UIView!
    @IBOutlet weak var mostInteractedImageView: UIImageView!
    @IBOutlet weak var mostInteractedPeopleList: UILabel!
    
    static var identifier = "CategoriesFollowingTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "CategoriesFollowingTableViewCell", bundle: nil)
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
