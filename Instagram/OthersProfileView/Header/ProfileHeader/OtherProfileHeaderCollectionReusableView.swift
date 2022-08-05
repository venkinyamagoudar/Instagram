//
//  OtherProfileHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/14/22.
//

import UIKit

protocol OtherProfileHeaderCollectionReusableViewDelegate: AnyObject {
    func didTapNumberOfPostsButton()
    func didTapNumberOfFollwers()
    func didTapNumberOfFollowing()
    func didTapFollowingButton()
    func didTapMessageButton()
    func didTapSuggestionButton()
}

class OtherProfileHeaderCollectionReusableView: UICollectionReusableView {
    
    public weak var otherProfileDelegate: OtherProfileHeaderCollectionReusableViewDelegate?

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
        otherProfileDelegate?.didTapNumberOfPostsButton()
        print("Posts")
    }
    
    @IBAction func didTapNumberOfFollwers(_ sender: Any) {
        otherProfileDelegate?.didTapNumberOfFollwers()
        print("followers")
    }
    
    @IBAction func didTapNumberOfFollowing(_ sender: Any) {
        otherProfileDelegate?.didTapNumberOfFollowing()
        print("NO. followin")
    }
    
    @IBAction func didTapFollowingButton(_ sender: Any) {
        print("Following")
        otherProfileDelegate?.didTapFollowingButton()
    }
    
    @IBAction func didTapMessageButton(_ sender: Any) {
        otherProfileDelegate?.didTapMessageButton()
        print("message")
    }
    
    @IBAction func didTapSuggestionButton(_ sender: Any) {
        otherProfileDelegate?.didTapSuggestionButton()
        print("suggest")
    }
}
