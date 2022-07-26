//
//  OthersSuggestedTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/22/22.
//

import UIKit

protocol OthersSuggestedTableViewCellDelegate {
    func removeCellFromTableMethod()
}

class OthersSuggestedTableViewCell: UITableViewCell {
    
    static var identifier = "OthersSuggestedTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "OthersSuggestedTableViewCell", bundle: nil)
    }
    
    public var cellDelegate : OthersSuggestedTableViewCellDelegate?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commonFollowerslabel: UILabel!
    @IBOutlet weak var followingButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
     
        followingButton.backgroundColor = .lightGray
        followingButton.titleLabel?.font = UIFont.systemFont(ofSize: 11)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func followButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        self.cellDelegate?.removeCellFromTableMethod()
    }
}
