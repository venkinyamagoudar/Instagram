//
//  MutualTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/22/22.
//

import UIKit

protocol MutualTableViewCellDelegate {
    func unfollowButtonMethod(button: UIButton)
    func followButtonMethod(button: UIButton)
}

class MutualTableViewCell: UITableViewCell {
    
    public var delegate: MutualTableViewCellDelegate?

    static var identifier = "MutualTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MutualTableViewCell", bundle: nil)
    }
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    public var trackButton = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
        
        buttonLabel.backgroundColor = .lightGray
        buttonLabel.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        buttonLabel.setTitleColor(UIColor.black, for: .normal)
        buttonLabel.setTitle("Following", for: .normal)
        
        
    }
    @IBAction func FollowingButtonTapped(_ sender: Any) {
        
        if trackButton == false{
            
            self.delegate?.unfollowButtonMethod(button: buttonLabel)
            trackButton = true
        } else if trackButton == true{
            
            self.delegate?.followButtonMethod(button: buttonLabel)
            trackButton = false
        }
    }
}
