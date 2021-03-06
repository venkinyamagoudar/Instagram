//
//  HomePagePostTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/24/22.
//

import UIKit

protocol HomePagePostTableViewCellDelegate : AnyObject {
    func didTapLabelAndProfile()
}

class HomePagePostTableViewCell: UITableViewCell {

    @IBOutlet weak var postedUserName: UILabel!
    @IBOutlet weak var postedUserProfile: UIImageView!
    @IBOutlet weak var postedImageName: UIImageView!
    
    public var postPageDelegate: HomePagePostTableViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapUserName = UITapGestureRecognizer(target: self, action: #selector(tappedUserName))
        postedUserName.isUserInteractionEnabled = true
        postedUserName.addGestureRecognizer(tapUserName)
        
        let tapProfileImage = UITapGestureRecognizer(target: self, action: #selector(tappedProfile))
        postedUserProfile.isUserInteractionEnabled = true
        postedUserProfile.addGestureRecognizer(tapProfileImage)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @objc func tappedProfile(sender: UITapGestureRecognizer){
        print("tapped image")
        postPageDelegate?.didTapLabelAndProfile()
    }
    
    @objc func tappedUserName(sender: UITapGestureRecognizer){
        print("tapped label")
        postPageDelegate?.didTapLabelAndProfile()
    }
    
}
