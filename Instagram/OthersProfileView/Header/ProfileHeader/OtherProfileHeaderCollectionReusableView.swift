//
//  OtherProfileHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/14/22.
//

import UIKit



class OtherProfileHeaderCollectionReusableView: UICollectionReusableView {

    static var identifier = "OtherProfileHeaderCollectionReusableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "OtherProfileHeaderCollectionReusableView", bundle: nil)
    }
    
    //Connections
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var numberOfPostsButton: UIButton!
    @IBOutlet weak var numberOfFollowersButton: UIButton!
    @IBOutlet weak var numberOfFollowingButton: UIButton!
    @IBOutlet weak var otheUserName: UILabel!
    
    var otherProfileHeaderViewModel = OtherProfileHeaderCollectionReusableViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .systemBackground
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
    }
    
    //Action Connections
    
    @IBAction func didTapNumberOfPosts(_ sender: Any) {
        otherProfileHeaderViewModel.otherProfileDelegate?.didTapNumberOfPostsButton()
        print("Posts")
    }
    
    @IBAction func didTapNumberOfFollwers(_ sender: Any) {
        otherProfileHeaderViewModel.otherProfileDelegate?.didTapNumberOfFollwers()
        print("followers")
    }
    
    @IBAction func didTapNumberOfFollowing(_ sender: Any) {
        otherProfileHeaderViewModel.otherProfileDelegate?.didTapNumberOfFollowing()
        print("NO. following")
    }
    
    @IBAction func didTapFollowingButton(_ sender: Any) {
        print("Following")
        otherProfileHeaderViewModel.otherProfileDelegate?.didTapFollowingButton()
    }
    
    @IBAction func didTapMessageButton(_ sender: Any) {
        otherProfileHeaderViewModel.otherProfileDelegate?.didTapMessageButton()
        print("message")
    }
    
    @IBAction func didTapSuggestionButton(_ sender: Any) {
        otherProfileHeaderViewModel.otherProfileDelegate?.didTapSuggestionButton()
        print("suggest")
    }
}
