//
//  SearchSelectionTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/1/22.
//

import UIKit



class SearchSelectionTableViewCell: UITableViewCell {
    
    static var identifier = "SearchSelectionTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "SearchSelectionTableViewCell", bundle: nil)
    }
    
  
    
    @IBOutlet weak var searchProfileView: UIImageView!
    @IBOutlet weak var searchUsername: UILabel!
    @IBOutlet weak var searchFullName: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(username: String, fullName: String, profileImage: UIImage){
        print("assign values")
    }
    
}
