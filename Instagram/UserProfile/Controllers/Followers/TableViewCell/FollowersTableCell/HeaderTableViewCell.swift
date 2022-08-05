//
//  HeaderTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/19/22.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var userContentView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var listOfRequest: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    static var identifier = "HeaderTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func ButtonTapped(_ sender: Any) {
        print("Go to list of followers requested")
    }
    
}
