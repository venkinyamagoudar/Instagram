//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/12/22.
//

import UIKit
protocol ProfileInfoHeaderCollectionReusableViewDelegate : AnyObject {
    func ProfileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func ProfileHeaderDidTapDiscoverPeopleButton(_ header: ProfileInfoHeaderCollectionReusableView)
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {

    static var identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegateProfile : ProfileInfoHeaderCollectionReusableViewDelegate?

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var numberOfPosts: UIButton!
    @IBOutlet weak var numberOfFollowing: UIButton!
    @IBOutlet weak var numberOfFollowers: UIButton!
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfileInfoHeaderCollectionReusableView", bundle: nil)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = self.profileImage.frame.width / 2
        profileImage.layer.borderWidth = 1.0
        
    }
    
    
    @IBAction func numberOfPosts(_ sender: Any) {
       delegateProfile?.ProfileHeaderDidTapPostButton(self)
    }
    
    @IBAction func numberofFollowing(_ sender: Any) {
        delegateProfile?.ProfileHeaderDidTapFollowingButton(self)
    }
    
    @IBAction func numberOfFollowers(_ sender: Any) {
        delegateProfile?.ProfileHeaderDidTapFollowersButton(self)
    }
    
    @IBAction func editProfileBUtton(_ sender: Any) {
        delegateProfile?.ProfileHeaderDidTapEditProfileButton(self)
    }
    
    @IBAction func discoverPeopleButton(_ sender: Any) {
        delegateProfile?.ProfileHeaderDidTapDiscoverPeopleButton(self)
    }
    
}
