//
//  HomePagePostTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/24/22.
//

import UIKit



class HomePagePostTableViewCell: UITableViewCell {

    @IBOutlet weak var postedUserName: UILabel!
    @IBOutlet weak var postedUserProfile: UIImageView!
    @IBOutlet weak var postedImageName: UIImageView!
    
    static var identifier = "StoryTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StoryTableViewCell", bundle: nil)
    }
    
    var homePagePostTableViewModel = HomePagePostTableViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postedUserProfile.layer.borderColor = UIColor.white.cgColor
        postedUserProfile.layer.cornerRadius = postedUserProfile.frame.width / 2
        postedUserProfile.layer.masksToBounds = true
        
        let tapUserName = UITapGestureRecognizer(target: self, action: #selector(tappedUserName))
        postedUserName.isUserInteractionEnabled = true
        postedUserName.addGestureRecognizer(tapUserName)
        
        let tapProfileImage = UITapGestureRecognizer(target: self, action: #selector(tappedProfile))
        postedUserProfile.isUserInteractionEnabled = true
        postedUserProfile.addGestureRecognizer(tapProfileImage)
        
    }
    
    @objc func tappedProfile(_ sender: UITapGestureRecognizer){
        print("tapped image")
        homePagePostTableViewModel.postPageDelegate?.didTapLabelAndProfile()
    }
    
    @objc func tappedUserName(_ sender: UITapGestureRecognizer){
        print("tapped label")
        homePagePostTableViewModel.postPageDelegate?.didTapLabelAndProfile()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
